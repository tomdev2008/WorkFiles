

Function Get-VMByMACAddress
{# .ExternalHelp  MAML-VMNetwork.XML
    Param( [parameter(Mandatory = $true, ValueFromPipeline = $true)]
           $MAC,
      
           [ValidateNotNullOrEmpty()] 
           $Server = "."  #May need to look for VM(s) on Multiple servers
    )
    process {
        if ($mac.count -gt 1 )  {$mac | ForEach-Object {Get-VMByMACaddress -mac $_ -server $server } }
        if ($Mac -is [string]) {$mac = $mac.replace("*","%")
          (@() +
           (get-wmiobject -ComputerName $Server -Namespace $HyperVNamespace -Query "Select * from MsVM_SyntheticEthernetPortSettingData  where address like '$mac'") + 
           (get-wmiobject -ComputerName $Server -Namespace $HyperVNamespace -Query "Select * from MsVM_EmulatedEthernetPortSettingData   where address like '$mac'")) | 
            ForEach-object {$_.getRelated("Msvm_VirtualSystemSettingData")} | ForEach-Object{ $_.getRelated("msvm_ComputerSystem") } | Select-Object -unique
        }

   }
}