$lstr_MigrateTarget   = "Live migrate to cluster node {0}"


Function Move-VM 
{# .ExternalHelp  MAML-VM.XML
   [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High')]
    param(
        [parameter(ValueFromPipeLine = $true)]
        $VM="%",
        
        [string]$Destination ,
        
        [ValidateNotNullOrEmpty()]
        $Server = ".",
        
        $PSC,
        [switch]$Force
    )
    process {
        if (-not (get-command -Name Move-ClusterVirtualMachineRole -ErrorAction "SilentlyContinue")) {Write-warning "Cluster commands not loaded. Import-Modue FailoverClusters and try again" ; return}
        if ($psc -eq $null)   {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -server $server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Move-VM -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $VMClusterGroup = Get-vmClusterGroup -vm $vm
            if  ($vmclusterGroup.State -ne "online") {Write-warning "$($vm.elementName) is either not a Highly available VM, or is not on-line" ; return}
            if (-not $destination) {$Destination = (Get-Clusternode -cluster $VM.__server | Where-Object {$_.state -eq "up" -and $_.name -ne $vmclusterGroup.ownernode.name} | Select-Object -first 1).name }
            if ($force -or $psc.shouldProcess(($lStr_VirtualMachineName -f $vm.elementName ), ($lstr_MigrateTarget   -f $destination))) {
	            Move-ClusterVirtualMachineRole -Node $destination -inputobject $vmclusterGroup |  
			            Add-Member -name "Origin"        -MemberType "Noteproperty" -Value $vm.__server    -passthru | 
                        Add-Member -name "VmElementName" -MemberType "Noteproperty" -Value $vm.elementName -passthru  

            } 
        }
    }
}
#$vmMoveResults = (get-vm -Running | move-vm -force) 
