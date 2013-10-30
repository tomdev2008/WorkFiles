$lstr_KVPRemoveSucess = "Removed Key {0} from Virtual Machine {1}"
$lstr_KVPRemoveFailure = "Failed to remove Key  {0} on Virtual Machine {1}, result code {3}"
$lstr_KVP_Waiting = "Waiting for KVP Exchange Service to finish"
$lstr_KVPRemove = "Remove Key Value Pair {0} "

Function Remove-VMKVP
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $VM="%", 
        
        [parameter(Mandatory = $true)]
        [String]$Key,
        
        [ValidateNotNullOrEmpty()]    
        $Server = ".",        #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)   {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM = (Get-VM -Name $VM -server $Server)}
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Remove-VMKVP  -VM $_ @PSBoundParameters}} 
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $KvpItem = ([wmiclass]"\\$($VM.__Server)\root\virtualization:Msvm_KvpExchangeDataItem").createinstance()
            $null=$KvpItem.psobject.properties #Without this the command will fail on Powershell V1 
            $KvpItem.Name = $key 
            $KvpItem.Data = ""
            $KvpItem.Source = 0
            $VSMgtSvc = (Get-WmiObject -computerName $vm.__server -NameSpace  $HyperVNamespace -Class "MsVM_virtualSystemManagementService") 
            if ($force -or $psc.shouldProcess(($lStr_VirtualMachineName -f $vm.elementName ), ($lstrRemove  -f $key ))) {
               $result=$VSMgtSvc.RemoveKvpItems($VM, @($KvpItem.GetText([System.Management.TextFormat]::WmiDtd20)) )   
               if     ($result.returnValue -eq 4096){test-wmijob $Result.job -wait -Description $lstr_KVP_Waiting -StatusOnly } 
               elseif ($result.returnValue -eq 0)   {$lstr_KVPRemoveSucess -f $key,$vm.elementName} else {$lstr_KVPRemoveFailure -f $key,$vm.elementName,$result}
            }   
       }
    }   
}


