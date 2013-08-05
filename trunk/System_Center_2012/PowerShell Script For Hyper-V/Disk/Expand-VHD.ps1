$Lstr_VHDexpansionSuccess              = "VHD {0} was expanded succesfully."
$Lstr_VHDexpansionFailure              = "The attempt to expand VHD {0} returned "
$Lstr_VHDExpanding                     =  "Expand VHD " 
$lstr_VHDExpandNotContract              = "{0} is currently {1}, in size. It is not possible to reduce the size to {2} as requested"


Function Expand-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$True )]
    param(
        [parameter(Mandatory=$true, ValueFromPipelineByPropertyName =$true, ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()][Alias("Fullname","Path","DiskPath")]
        [String[]]$VHDPaths,                #may expand multiple VHDs 
        
        [ValidateRange(1gb,2040GB)]
        [long]$Size = 127GB,
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = ".",   #Only work with images on one server  
        
        [switch]$Wait,
        $PSC, 
        [switch]$force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
          write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    =  (Get-VhdDefaultPath $Server) + "\" + $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if ($VHDPath -and ($force -or $psc.shouldProcess($VHDPath,$Lstr_VHDExpanding))) {  
                $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                $currentSize            = (Get-VHDInfo -VHDPath $VHDPath -Server $Server).MaxInternalSize
                if ($Size -gt $currentSize) {
                    if ( ($ImageManagementService.ExpandVirtualHardDisk($VHDPath, $Size) | Test-wmiResult -wait:$wait -JobWaitText ($Lstr_VHDExpanding + $vhdPath)`
                                -SuccessText ($Lstr_VHDexpansionSuccess -f $vhdPath) -failText ($Lstr_VHDexpansionFailure -f $vhdPath) ) -eq [returnCode]::ok) {Get-VHDInfo -VHDPath $VHDPath -Server $Server }
                }   
                Else  {write-warning ($lstr_VHDExpandNotContract -f $VHDPath, $currentSize, $size) }
           }
       }
    }
}                
