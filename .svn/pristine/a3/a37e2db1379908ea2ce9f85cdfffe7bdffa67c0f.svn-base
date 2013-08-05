$lstr_RemoveSnapShotSuccess   = "Successfully removed snapshot {0}"
$lstr_RemoveSnapShotFailure   = "The attempt to remove the snapshot {0} failed with the result "
$lstr_RemoveSnapShot          = "Remove Snapshot "


Function Remove-VMSnapshot
{# .ExternalHelp  MAML-VMSnapshot.XML
    [CmdletBinding(SupportsShouldProcess=$true  , ConfirmImpact='High' )]
    Param(
        [parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)][allowNull()]
        $Snapshot , 
        [Switch]$Tree , 
        [Switch]$wait,
        $PSC,
        [switch]$Force
        )
    Process {    
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ( $SnapShot.count -gt 1 ) {[Void]$PSBoundParameters.Remove("SnapShot") ;  $SnapShot | ForEach-object {Remove-VMSnapshot -snapshot $_  @PSBoundParameters}} 
        if (($snapshot.__class -eq 'Msvm_VirtualSystemSettingData') -and ($force -or $psc.shouldProcess($snapshot.elementName , $lstr_RemoveSnapShot))) {
            $VSMgtSvc=Get-WmiObject -ComputerName $snapshot.__server -NameSpace  $HyperVNamespace -Class "MsVM_virtualSystemManagementService"
            if ($tree) {$result=$VSMgtSvc.RemoveVirtualSystemSnapshotTree($snapshot) }
            else       {$result=$VSMgtSvc.RemoveVirtualSystemSnapshot($snapshot)     }
            $result    | Test-wmiResult -wait:$wait -JobWaitText ($lstr_RemoveSnapShot + $snapshot.elementName)`
                                        -SuccessText ($lstr_RemoveSnapShotSuccess -f $snapshot.elementName) `
                                        -failText    ($lstr_RemoveSnapShotFailure -f $snapshot.elementName)  
       }
   }
}                