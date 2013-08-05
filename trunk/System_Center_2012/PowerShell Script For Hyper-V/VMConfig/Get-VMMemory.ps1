

Function Get-VMMemory
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeLine = $true)]
        $VM="%", 
        
        [ValidateNotNullOrEmpty()]
        $Server = "."
    )
    Process {
         Foreach ($v in (Get-vmSettingData -vm $vm -server $server) ) {
             $v.getRelated("MSVM_MemorySettingData") |  Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($v.elementName) 
         }
    }     
}