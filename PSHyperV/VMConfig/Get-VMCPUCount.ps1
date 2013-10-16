

Function Get-VMCPUCount
{# .ExternalHelp  MAML-VMConfig.XML
    param(
        [parameter(ValueFromPipeLine = $true)]
        $VM="%",  
        
        [ValidateNotNullOrEmpty()]
        $Server = "."        #May need to look for VM(s) on Multiple servers
        )
     Process {
         Foreach ($v in (Get-vmSettingData -vm $vm -server $server) ) {
             $v.getRelated("MsVM_ProcessorSettingData") |  Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($v.elementName) 
         }
     } 
}