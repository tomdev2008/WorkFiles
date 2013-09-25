$lstr_KVPSet = "Set Key Value Pair to {0}--{1} "
$lstr_KVPSetSucess = "Set Key Value Pair {0}--{1} on Virtual Machine {2}"
$lstr_KVPSetFailure = "Failed to set Key Value Pair {0}--{1} on Virtual Machine {2}, result code {3}"
$lstr_KVP_Waiting = "Waiting for KVP Exchange Service to finish"
  
Function Add-VMKVP
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $VM="%", 
        
        [parameter(Mandatory = $true)]
        [String]$Key,
        
        [parameter(Mandatory = $true)]
        [String]$Value,
        
        [string]$Server = ".", 
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM = (Get-VM -Name $VM -server $Server)}
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-KVP  -VM $_ @PSBoundParameters}} 
        if ($VM -is [System.Management.ManagementObject]) {
            $KvpItem = ([wmiclass]"\\$($vm.__server)\root\virtualization:Msvm_KvpExchangeDataItem").createinstance()
            $null=$KvpItem.psobject.properties #Without this the command will fail on Powershell V1 
            $KvpItem.Name = $key 
            $KvpItem.Data = $Value 
            $KvpItem.Source = 0 
            $VSMgtSvc = (Get-WmiObject -computerName $vm.__server -NameSpace  $HyperVNamespace -Class "MsVM_virtualSystemManagementService") 
            if ($force -or $psc.shouldProcess(($lStr_VirtualMachineName -f $vm.elementName ), ($lstr_KVPSet -f $key,$value))) {
                $result=$VSMgtSvc.AddKvpItems($VM, @($KvpItem.GetText([System.Management.TextFormat]::WmiDtd20)))     
                if     ($result.returnValue -eq 4096){test-wmijob $result.job -wait -Description $lstr_KVP_Waiting -StatusOnly } 
                elseif ($result.returnValue -eq 0)   {$lstr_KVPSetSucess -f $key,$Value,$vm.elementName  } else {write-error ($lstr_KVPSetFailure -f $key,$Value,$vm.elementName,$result )}
            }
        }
   }     
}      

