

Function Get-VMNIC
{# .ExternalHelp  MAML-VMNetwork.XML    
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM="%", 
     
        [ValidateNotNullOrEmpty()] 
        $Server = ".", #May need to look for VM(s) on Multiple servers

        [switch]$Legacy ,
        [switch]$VMBus)
    Process {     
        if ((-not ($legacy)) -and (-not ($VmBus)) ) {$vmbus = $legacy=$True}
        if ($VM -is [String])  {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VmNic -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $vssd = Get-VMSettingData $vm 
            if ($legacy) {$vssd.getRelated("MsVM_EmulatedEthernetPortSettingData") |  
                          Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($vm.elementName) |
                          Add-Member -PassThru -name "SwitchName"    -MemberType Scriptproperty -value { (Get-VMnicSwitch -Nic $this).ElementName }
            }
            if ($vmbus)  {$vssd.getRelated("MsVM_SyntheticEthernetPortSettingData") | 
                          Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($vm.elementName) |
                          Add-Member -PassThru -name "SwitchName"    -MemberType Scriptproperty -value { (Get-VMnicSwitch -Nic $this).ElementName }
            }
        }
    }
}