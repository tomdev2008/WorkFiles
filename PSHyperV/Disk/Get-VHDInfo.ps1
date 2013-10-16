$Lstr_GetDiskInfoFailed              = "Could not get disk information for {0}, return code:{1} "


Function Get-VHDInfo 
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipelineByPropertyName =$true,ValueFromPipeline =$true)][Alias("Fullname","Path","DiskPath")][ValidateNotNullOrEmpty()]
        [string[]]$VHDPaths,              #Accept One string, multiple string, or convert objects to string from one of their properties. 
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = "."   #Only work with images on one server  
    )
    process {
        if ($vhdPaths -eq $null) {$vhdPaths = "$(Get-VhdDefaultPath)\*" }
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    = (Get-VhdDefaultPath $Server) +'\' +  $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if ($VHDPath)                          {              
        	    $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                $result = $ImageManagementService.GetVirtualHardDiskInfo($vhdPath)
                if ($result.returnValue -eq [ReturnCode]::OK) {
                    ([XML]$Result.info).SelectNodes("/INSTANCE/PROPERTY") | 
                        Foreach-object -begin   { $VHDObj = New-Object -TypeName System.Object
                                                  Add-Member -inputObject $VHDObj -MemberType NoteProperty -Name "Path"     -Value $vhdPath
                                        }`
                                       -process { Add-Member -inputObject $VHDObj -MemberType NoteProperty -Name $_.Name    -Value $_.Value} `
                                       -end     { Add-Member -inputObject $VHDObj -MemberType NoteProperty -Name "TypeName" -Value ([VHDType]$VHDObj.type)
						  Add-member -inputObject $VHDObj -MemberType scriptMethod -Name "ToString" -Value {$this.path} -force
                                                  $VHDObj }
                 }
                 else {Write-Error ($Lstr_GetDiskInfoFailed -f $VhdPath, [ReturnCode]$result.returnValue ) }
            }
       }
    }
}	
