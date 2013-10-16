$Lstr_VHDConvertSuccess              = "VHD {0} was Converted succesfully into {1}."
$Lstr_VHDConvertFailure              = "The attempt to Convert VHD {0} returned "
$Lstr_VHDConverting                  = "Convert VHD {0} into {1}" 
$Lstr_VHDConversion                  = "Convert VHD into {0}" 

Function Convert-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$True )]
    param(
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName =$true,ValueFromPipeline =$true)][Alias("Fullname","Path","DiskPath")][ValidateNotNullOrEmpty()]
        [string]$VHDPaths,          
        
        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()][Alias("Destination","NewName")]
        $DestPath, #  can be a string or script block for example > dir d:\vhds | get-vhdinfo | where {$_.typeName -eq "Dynamic"} | convert-vhd -dest {$_ -replace ".VHD","-Fixed.VHD" } -type fixed
        
        [Parameter(Mandatory = $true)]
        [VHDType]$Type,
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = ".",   #Only work with images on one server  
         
        [switch]$Wait,
        $PSC, 
        [switch]$Force
    )
    Process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $VHDPaths) -contains $true))  
            {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) 
        }
        Foreach ($VHDPath in $VHDPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w")              {$VHDPath     = (Get-VhdDefaultPath $Server) + "\" + $VHDPath }
            if ($VHDPath -notmatch "VHD$" )                     {$VHDPath    += ".VHD"}
            
            if ($DestPath -is [scriptblock]  )                  {$Destination = Invoke-Expression $(".{$DestPath}") } 
            else                                                {$Destination = $DestPath }
            write-debug "Before resolution Destination = $destination" 
            if ($Destination -notmatch "(\w:|\w)\\\w")          {$Destination  = (Get-VhdDefaultPath $Server) + "\" + $Destination }
            if ($Destination -notmatch ".VHD$" )                {$Destination += ".VHD"}
            if (($Server -eq ".") -and 
                (-not (Test-path -path $Destination -IsValid))) {$Destination  = $null }
            
            write-Debug "After resolution: VHD = $VHDPath Destination =  $destination"
            if ($VHDPath -is [string] -and  $Destination -Is [String] -and ($force -or $psc.shouldProcess($VHDPath,($Lstr_VHDConversion -f $destination)))) {  
                $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName 
                $ImageManagementService.ConvertVirtualHardDisk($VHDPath, $Destination, $type) | Test-wmiResult -wait:$wait -JobWaitText ($Lstr_VHDConverting -f $VHDPath,$Destination)`
                     -SuccessText ($Lstr_VHDConvertSuccess -f $VHDPath,$Destination) -failText ($Lstr_VHDConvertFailure -f $VHDPath,$Destination)     
            }
        }
    }    
}