

Function Get-VMSwitch
{# .ExternalHelp  MAML-VMNetwork.XML    
    param(
        [parameter(ValueFromPipeline = $true)][Alias("Name")]
        [String]$VirtualSwitchName="%",
       
        [ValidateNotNullOrEmpty()] 
        $Server = "."    #Can query multiple servers for switches
        )
    process {
        $VirtualSwitchName=$VirtualSwitchName.replace("*","%")
        Get-WmiObject -computerName $server -NameSpace  $HyperVNamespace   -query "Select * From MsVM_VirtualSwitch Where elementname like '$VirtualSwitchname' "
    }
}