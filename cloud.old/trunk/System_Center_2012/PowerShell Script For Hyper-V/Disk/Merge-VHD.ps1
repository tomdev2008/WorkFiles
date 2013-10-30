$Lstr_VHDMergeContinues               = "The job to merge the VHD {0} into {1} has not finished. You can use Test-WmiJob to check progress, the ID is:`n {2}"
$Lstr_VHDMergeSuccess                 = "VHD {0} merged succesfully into {1}"
$Lstr_VHDMergeFailure                 = "The attempt to merge VHD {0} into {1} failed with a response of"
$lStr_ServerName                      = "Server: {0}"
$lstr_VHDMerge                        = "Merge {0} into {1}"


Function Merge-VHD
{# .ExternalHelp  MAML-VMDisk.XML
   [CmdletBinding(SupportsShouldProcess=$True )]
    param(
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName  = $true)][ValidateNotNullOrEmpty()][Alias("path","FullName")]
        [string]$VHDPaths, 
        
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        $DestPath,       # can be a string or a scriptblock 
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = ".",   #Only work with images on one server   
        
        [switch]$Wait
    )
    Process {
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    = (Get-VhdDefaultPath $Server) + '\' + $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if ($VHDPath)                          {
                write-debug "Before resolution Destination = $destination" 
                if ($DestPath -is [scriptblock]  )         { $Destination = Invoke-Expression $(".{$DestPath}") } else {$destination = $DestPath}
                if ($Destination -notmatch "(\w:|\w)\\\w") { $Destination = (Get-VhdDefaultPath $Server) + "\" + $Destination }
                if ($Destination -notmatch ".VHD$"  )      { $Destination += ".VHD"}
                if ($server -eq "."              )         { if (-not (Test-Path -Path $Destination -IsValid  -ErrorAction SilentlyContinue)) {$Destination = $null} }
                write-Debug "After resolution: VHD = $vhdpath Destination =  $destination"
                if ($vhdPath -is [string] -and $Destination -is [string] -and $pscmdlet.shouldProcess(($lStr_ServerName -f $server) , ($lstr_VHDMerge -f $VhdPath,$Destination) ) ) {
                    $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace  $HyperVNamespace -Class $ImageManagementServiceName 
                    if ( ($ImageManagementService.MergeVirtualHardDisk($VHDPath, $Destination)   | Test-wmiResult -wait:$wait -JobWaitText($lstr_VHDMerge -f $VhdPath,$Destination) `
                                        -SuccessText ($Lstr_VHDMergeSuccess -f $VHDPath,$Destination)  -failText ($Lstr_VHDMergeFailure -f $vhdPath ,$Destination) ) -eq [returnCode]::ok) {
                        Get-VHDInfo -VHDPath $VHDPath -Server $Server
                    } 
                }     
            }
       }
    }     
}