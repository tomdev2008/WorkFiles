$lstr_notConnected = "Not Connected"


Function Get-VMNICSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    Param ( 
            [parameter(Mandatory = $true, ValueFromPipeline = $true)]
            $NIC
          )
    Process {
        if ($NIC.count -gt 1  ) {$NIC | ForEach-object {Get-VMnicSwitch  -NIC $_ }} 
        if ($NIC.__CLASS -like "*EthernetPortSettingData") {
            if ($nic.Connection) {([WMI]$nic.Connection[0]).getRelated("Msvm_VirtualSwitch") }# Get-WmiObject -computerName $nic.__server -NameSpace $HyperVNamespace -Query "ASSOCIATORS OF {$($nic.Connection)} where resultclass = Msvm_VirtualSwitch" }
            else {$lstr_notConnected }
        }
    }
 
}
