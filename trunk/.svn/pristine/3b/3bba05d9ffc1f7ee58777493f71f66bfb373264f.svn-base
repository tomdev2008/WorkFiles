$lstr_VMHeartBeatICNotFound = "No Heartbeat component found" 
$Lstr_VMHeartBeatWaiting    = "Waiting for heartbeat"


Function Test-VMHeartBeat
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    Param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [Alias("TimeOut")]
        [int]$HeartBeatTimeOut ,
        
        [ValidateNotNullOrEmpty()]
        $Server = "."   #May need to look for VM(s) on Multiple servers
    )   
    Process {
        $Endtime=(get-date).addSeconds($HeartBeatTimeOut)
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | Foreach-object {Test-VmHeartbeat -VM $_ @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
             $Status= $lstr_VMHeartBeatICNotFound
             Do {
                 $hb = get-wmiobject  -computername $vm.__SERVER -namespace $HyperVNamespace  -Query "associators of {$($vm.__path)} where resultclass=Msvm_HeartbeatComponent" 
                 if ($hb -is [System.Management.ManagementObject]) {$status= [HeartBeatICStatus]$hb.OperationalStatus[0]}
                 $pending = ((get-date) -lt $endTime) -and ($status -ne [HeartBeatICStatus]::OK) 
                 if ($pending) {write-progress -activity $Lstr_VMHeartBeatWaiting   -Status $vm.elementname -Current $status; start-sleep 5}
             } while ($Pending)
             write-progress -completed -activity $Lstr_VMHeartBeatWaiting -Status $vm.elementname        
             $vm | select-object elementName, @{Name="Status"; expression={$status}}  
        }
   }
}
