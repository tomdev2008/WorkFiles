$lstr_validating                     = "Validating {0}"
$LStr_WMIJobFailed2                  = "The WMI Job failed with status {0} `n {1} "
$lStr_ErrorValidatingVHD             = "Error while validating VHD - Error Code: {0}"
$lstr_TestVhdSilentError              = "The test did not complete but no error was returned. This is probably because an invalid file was specified"

Function Test-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName  = $true)][Alias("Fullname","Path","DiskPath")]
        [string[]]$VHDPaths,             #may be single or multiple paths
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = "."   #Only work with images on one server  
    )
    Process {
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    =  (Get-VhdDefaultPath $Server) +'\' + $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if ($VHDPath)                          {
                $ImageManagementService = Get-WmiObject -ComputerName $server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                write-verbose ($lstr_validating  -f $VHDPath)
                $result = $ImageManagementService.ValidateVirtualHardDisk($VHDPath)
                if     ($result.returnValue -eq [ReturnCode]::OK)         { return $true }
                elseif ($result.returnValue -eq [ReturnCode]::JobStarted) {
                    $job = Test-WMIJob $result.job -wait -Description ($lstr_validating -f $VHDPath)
                    if ($job.JobState -eq [JobState]::Completed) {return $true }
                    else  {if ($job.ErrorDescription) {write-warning  $job.ErrorDescription}
                           else                       {write-warning  $lstr_TestVhdSilentError}
                           return $false  
                    }
                }   
                else  { write-error  ($lStr_ErrorValidatingVHD -f [ReturnCode]$Result.ReturnValue ) 
                        return $false
               }
           }
        } 
    }     
}