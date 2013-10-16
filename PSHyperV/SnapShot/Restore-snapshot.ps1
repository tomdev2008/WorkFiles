$lstr_VMWillBeStopped                = "VM {0} is currently {1} and needs to be stopped" 
$lstr_RestoreSnapShotSuccess         = "Successfully restored snap shot to VM {0}"
$lstr_RestoreSnapShotFailure         = "Failed to restore snap shot to VM {0}, the result was "
$Lstr_RestoreSnapShot                = "Restore SnapShot "


Function Restore-VMSnapshot
{# .ExternalHelp  MAML-VMSnapshot.XML
    [CmdletBinding(SupportsShouldProcess=$true  , ConfirmImpact='High' )]
    Param(
      [parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)]
      $SnapShot, 
      
      $PSC, 
 
      [Switch]$Force , 
      [Switch]$Restart, 
      [Switch]$wait)
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
         if ($SnapShot.count -gt 1 ) {[Void]$PSBoundParameters.Remove("SnapShot") ;  $SnapShot | ForEach-object {Restore-snapshot -snapshot $_  @PSBoundParameters}} 
         if ($snapshot.__class -eq 'Msvm_VirtualSystemSettingData') {
             $VM = Get-WmiObject -computername $snapshot.__server -NameSpace "root\virtualization" -Query ("Select * From MsVM_ComputerSystem Where Name='$($Snapshot.systemName)' " )
             if ($vm.enabledState -ne [vmstate]::stopped) {write-warning ($lstr_VMWillBeStopped -f $vm.elementname , [vmstate]$vm.enabledState) ; Stop-VM $vm -wait -psc $psc -force:$force}
             if ($force -or $psc.shouldProcess($vm.ElementName , $Lstr_RestoreSnapShot)) {
                 $VSMgtSvc=Get-WmiObject -ComputerName $snapshot.__server -NameSpace  "root\virtualization" -Class "MsVM_virtualSystemManagementService" 
                 if ( ($VSMgtSvc.ApplyVirtualSystemSnapshot($VM,$snapshot)  | Test-wmiResult -wait:$wait -JobWaitText ($lstr_RestoreSnapShot + $vm.elementName)`
                                                                            -SuccessText ($lstr_RestoreSnapShotSuccess -f $VM.elementname) `
                                                                            -failText ($lstr_RestoreSnapShotFailure -f  $vm.elementname) ) -eq [returnCode]::ok) {if ($Restart) {Start-vm $vm}  }
              }
         }
    } 
}
