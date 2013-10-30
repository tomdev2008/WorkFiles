$Lstr_RemoveSwitchPortStatus        = "Removal of Virtual Switch Port returned {0}" 

Function Remove-VMNIC
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true ,  ValueFromPipeline = $true)]
        $NIC,
        
        $PSC, 
        [switch]$Force,
        
        $VM, $Server #VM no longer required, but preserved for compatibility with V1 
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($NIC.count -gt 1  ) {[Void]$PSBoundParameters.Remove("NIC") ;  $NIC | ForEach-object {Remove-VMNIC  -NIC $_  @PSBoundParameters}}
        if ($nic.__CLASS -like "*EthernetPortSettingData")  {remove-VMRasd -rasd $NIC -PSC $psc -force:$force }
            # note: In V1 the switch port was removed before removing the NIC, but this is done automatically. 	        
    }
}            
