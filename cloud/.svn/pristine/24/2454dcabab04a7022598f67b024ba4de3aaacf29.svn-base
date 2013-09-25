

Function Select-VMNIC
{# .ExternalHelp  MAML-VMNetwork.XML    
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM="%", 
     
        [ValidateNotNullOrEmpty()] 
        $Server = ".",  #May need to look for VM(s) on Multiple servers
        
        [Switch]$multiple
    )
    Process { Get-VMnic -VM $vm -Server $Server -legacy -vmbus | Select-list -multiple:$multiple -property "ResourceSubType", "address", @{label="Network"; expression={(get-vmnicSwitch $_).elementname}}   }
}
