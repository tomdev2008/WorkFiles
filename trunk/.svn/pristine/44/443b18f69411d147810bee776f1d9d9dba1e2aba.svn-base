
$LStr_RemoveVMDescription = "Removing VM {0}"
$LStr_WMIjobfailed2 = "The WMI Job failed with status {0} `n {1} "
$LStr_RemoveVMFailure = "Unable to remove the VM {0} " 
$LStr_RemoveVMSuccess = "Sucessfully removed the VM {0} " 
$LStr_RemoveVMAction = "Remove-VM"

Function Remove-VM
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$true  , ConfirmImpact='High' )]
    Param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [ValidateNotNullOrEmpty()]
        $Server = ".",  #May need to look for VM(s) on Multiple servers
        [switch]$wait,
        $PSC, 
        [switch]$Force
        )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [string]) { $VM = Get-VM -Name $VM -Server $Server }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-Object  {Remove-VM -VM $_  @PSBoundParameters}}        
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem'){
            $VSMgtSvc = Get-WmiObject -ComputerName $vm.__Server -Namespace $HyperVNamespace -Class "MSVM_VirtualSystemManagementService"
            if ($force -or  $psc.shouldProcess($vm.ElementName,$LStr_RemoveVMAction) ) {  
                if (get-module failoverClusters -ErrorAction silentlycontinue) {Get-vmClusterGroup $vm | Remove-ClusterGroup -RemoveResources -force}
                $VSMgtSvc.DestroyVirtualSystem( $VM.__Path ) | Test-wmiResult -wait:$wait -JobWaitText ($LStr_RemoveVMDescription -f $VM.ElementName)`
                            -SuccessText ($LStr_RemoveVMSuccess -f $vm.elementName) -failText ($LStr_RemoveVMFailure -f $VM.ElementName)  
           }
        }
    }   
}