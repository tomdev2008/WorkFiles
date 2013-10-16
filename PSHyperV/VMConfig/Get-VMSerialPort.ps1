

Function Get-VMSerialPort
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding()]
     param(
        [parameter(ValueFromPipeline = $true)]
        $VM="%", 
        
        [Alias("PortNo")]
        $PortNumber ,
        
        [ValidateNotNullOrEmpty()]
        $Server = "."       #May need to look for VM(s) on Multiple servers
    )
    process {Foreach ($v in (Get-vmSettingData -vm $vm -server $server) ) {
                 $v.getRelated("MSVM_ResourceAllocationSettingData") | 
                   Where-Object {($_.ResourceSubType -eq "Microsoft Serial Port") -and ($_.Caption -like "*$PortNumber")}  |
                      Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($v.elementName) 
                } 
   }
}