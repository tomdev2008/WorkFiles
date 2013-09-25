$Lstr_VHDconnectSuccess              = "VHD {0} was reconnected succesfully."
$Lstr_VHDconnectFailure              = "The attempt to reconnect VHD {0} to its parent returned "
$Lstr_VHDconnecting                  = "Reconnect VHD to parent " 


Function Connect-VHDParent
{# .ExternalHelp  MAML-VMDisk.XML    
    [CmdletBinding(SupportsShouldProcess=$True )]
    param(
    
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName =$true,ValueFromPipeline =$true)][Alias("Fullname","Path","DiskPath")][ValidateNotNullOrEmpty()]
        [string[]]$VHDPaths,              #Accept One string, multiple string, or convert objects to string from one of their properties. 
        
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][Alias("ParentDiskPath","ParentPath")]
        $ParentVHDPath,   
  
        [ValidateNotNullOrEmpty()] 
        [string]$Server = ".",  #Only work with images on one server  
   
        $PSC, 
        [switch]$force
    )
    process {
        if ($psc -eq $null)                        {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w")  {$VHDPath    = (Get-VhdDefaultPath $Server) +"\" + $VHDPath }
            if ($vhdpath -notmatch "VHD$" )         {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHD Path = $VHDPath"            
            write-debug "Before Resolution Parent Path = $ParentVHDPath"            
            if ($ParentVHDPath -is [scriptblock]  ) {$Parent     = Invoke-Expression $(".{$ParentVHDPath}") } 
            else                                    {$Parent     = $ParentVHDPath}
            if ($Parent -notmatch "(\w:|\w)\\\w")   {$Parent     = (Get-VhdDefaultPath $Server) +"\" + $Parent}
            if ($Parent -notmatch "VHD$" )          {$Parent    += ".VHD"}
            if ($Server -eq ".")                    {$Parent     = (Resolve-Path $Parent -ErrorAction "silentlyContinue" ).path }
            write-debug "After Resolution Parent Path = $Parent "            
            if ($vhdpath -is [string] -and $Parent -is [string] -and ($force -or $psc.shouldProcess($VHDPath,$Lstr_VHDconnecting  ))) {          
                $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                 $ImageManagementService.ReconnectParentVirtualHardDisk($VHDPath,$parent,$true) | Test-wmiResult -wait -JobWaitText ($Lstr_VHDconnecting + $vhdPath)`
                     -SuccessText ($Lstr_VHDconnectSuccess -f $vhdPath) -failText ($Lstr_VHDconnectFailure -f $vhdPath)    
            }
        }         
    }
}