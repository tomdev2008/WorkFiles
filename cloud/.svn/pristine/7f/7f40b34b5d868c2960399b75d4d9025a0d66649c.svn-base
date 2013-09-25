

Function Get-VMNICVLAN
{# .ExternalHelp  MAML-VMNetwork.XML
    param  (  [parameter(Mandatory = $true, ValueFromPipeline = $true)]
              $NIC
    )
    
    process {  if ($NIC.count -gt 1 ) {[Void]$PSBoundParameters.Remove("NIC") ;  $NIC | ForEach-object {Get-VMNICVLAN -NIC $_ @PSBoundParameters}}
               if ($nic.connection) {(Get-WmiObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$($nic.connection[0])} where assocClass=msvm_bindsto" | 
                           foreach-object {Get-WmiObject -ComputerName $Nic.__Server  -Namespace $HyperVNamespace -q "associators of {$_} where assocClass=MSVM_NetWorkElementSettingData"}).accessVlan}
    }
}