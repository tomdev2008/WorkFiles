$lStr_SetVLAN = "Set VLAN ID  {0}"


Function Set-VMNICVLAN
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param  ( [parameter(Mandatory = $true, ValueFromPipeline = $true)]
              $NIC,
              $VLANID,
              $PSC,
              [Switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($NIC.count -gt 1  ) {[Void]$PSBoundParameters.Remove("NIC") ;  $NIC | ForEach-object {Set-VMVLAN  -NIC $_ @PSBoundParameters}}
        if ($nic.connection) {
            $vlan = Get-WMIObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$($nic.connection[0])} where assocClass=MSVM_hostedAccessPoint" | 
                          ForEach-Object {Get-WMIObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$_} where ResultClass=Msvm_SwitchPort" }  | 
                                 where-object { ( Get-WMIObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$_} where ResultClass=Msvm_SwitchLanEndPoint" |
                                                 ForEach-Object {Get-WMIObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$_} where ResultClass=Msvm_ExternalEthernetPort"}) 
                                              } | ForEach-Object { Get-WMIObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$_} where assocClass=MSVM_Bindsto" }
           if ($force -or $psc.shouldProcess(($nic.ElementName), ( $lStr_SetVLAN -f $VLANID  ))) {
               if ($vlan.DesiredEndpointMode -ne 5 ) {$vlan.DesiredEndpointMode=5   ; $vlan.put() | out-null }
               $vlanSetting=Get-WmiObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$vlan} where assocClass=MSVM_NetWorkElementSettingData"
               if ($vlanSetting.TrunkedVLANList -notContains $VlanID) {$vlanSetting.TrunkedVLANList += $vlanID ; $vlanSetting.put() | out-null}
               $vlanSetting=Get-WmiObject -ComputerName $Nic.__Server -Namespace $HyperVNamespace -q "associators of {$($nic.connection[0])} where assocClass=msvm_bindsto" | 
                               foreach-object {Get-WmiObject -Namespace -ComputerName $Nic.__Server $HyperVNamespace -q "associators of {$_} where assocClass=MSVM_NetWorkElementSettingData"}
               $vlanSetting.accessVlan = $vlanID ; [wmi]$vlanSetting.put().path
           }     
       }
    }
}