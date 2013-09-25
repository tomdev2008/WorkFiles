

Function Get-VMSnapshotTree
{# .ExternalHelp  MAML-VMSnapshot.XML
    Param(
      [parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)]
      $VM, 
 
      [ValidateNotNullOrEmpty()] 
      $Server="."   #May need to look for VM(s) on Multiple servers
    )

    if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
    if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
        $snapshots=(Get-VMSnapshot -VM $VM ) 
       if ($snapshots -is [array]) {out-tree -items $snapshots -startAt ($snapshots | where-object {$_.parent -eq $null}) -path "__Path" -Parent "Parent" -label "elementname"}
       else {$snapshots | foreach-object {"-" + $_.elementName} }
    }
}
