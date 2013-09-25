$Lstr_VHDcompactSuccess              = "VHD {0} was compacted succesfully."
$Lstr_VHDcompactFailure              = "The attempt to compact VHD {0} returned "
$Lstr_VHDcompacting                  = "compact VHD " 


Function Compress-VHD
{# .ExternalHelp  MAML-VMDisk.XML    
    [CmdletBinding(SupportsShouldProcess=$True )]
    param(
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName =$true,ValueFromPipeline =$true)][Alias("Fullname","Path","DiskPath")][ValidateNotNullOrEmpty()]
        [string[]]$VHDPaths,              #Accept One string, multiple string, or convert objects to string from one of their properties. 
      
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = ".",   #Only work with images on one server  
        
        [switch]$Wait,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc      = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath   = (Get-VhdDefaultPath $Server) + "\" + $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath  += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"
            if ($vhdpath -is [string] -and ($force -or $psc.shouldProcess($VHDPath,$Lstr_VHDcompacting))) {          
                $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                $ImageManagementService.CompactVirtualHardDisk($VHDPath) | Test-wmiResult -wait:$wait -JobWaitText ($Lstr_VHDcompacting + $vhdPath)`
                     -SuccessText ($Lstr_VHDcompactSuccess -f $vhdPath) -failText ($Lstr_VHDcompactFailure -f $vhdPath)    
            }
        }              
    }
}
