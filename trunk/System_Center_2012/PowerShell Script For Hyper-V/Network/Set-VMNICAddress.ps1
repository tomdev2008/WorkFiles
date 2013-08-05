
Function Set-VMNICAddress
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(
        [parameter(Mandatory = $true , ValueFromPipeLine = $true)]
        $NIC, 

        [parameter(Mandatory = $true)][ValidatePattern('^[0-9|a-f]{12}$')]
        [String]$MAC,

        $PSC, 
        [switch]$Force,
        # VM is preserved for backwards compatibility but is ignored
        $VM , $Server 
    ) 
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($NIC.count -gt 1  ) {[Void]$PSBoundParameters.Remove("NIC") ;  $NIC | ForEach-object {Set-VMNICAddress  -NIC $_ @PSBoundParameters}}
        if ($nic.__CLASS -like "*EthernetPortSettingData")  {           
            $vssd                 = get-wmiobject -computername $nic.__Server -namespace $HyperVNamespace -query "associators of {$nic}  where resultclass=Msvm_VirtualSystemSettingData"
            $vm                   = get-wmiobject -computername $nic.__Server -namespace $HyperVNamespace -query "associators of {$vssd} where resultClass=msvm_ComputerSystem" 
            $nic.address          = $mac 
	        $nic.staticMacAddress = $true
            Set-VMRASD -vm $vm -rasd $NIC -psc $psc -force:$force
       }
   }
   
}
