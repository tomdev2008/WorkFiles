

Function Update-VMSnapshot
{# .ExternalHelp  MAML-VMSnapshot.XML
    [CmdletBinding(SupportsShouldProcess=$true  , ConfirmImpact='High' )]
    Param(
        [parameter( Mandatory = $true, ValueFromPipeline = $true)][ValidateNotNullOrEmpty()] 
        $VM , 
        
        [Alias("SnapshotName")]
        $SnapName, 
        
        $Note,
        
        [ValidateNotNullOrEmpty()] 
        $Server=".",
        $PSC,
        [Switch]$Force
        ) 
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object { Update-VMSnapshot -VM $_  @PSBoundParameters}} 
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            if ($snapName -eq $null) {$snapName=(Get-VMSnapshot $vm -newest ).elementname } 
            If ($snapName) {rename-VMsnapshot  -vm $vm -SnapName $snapName -newName "Delete-me" -force:$force -psc $psc}
            new-vmSnapshot $vm -wait -note $note -force:$force -psc $psc | rename-VMsnapshot -Newname $snapName -force:$force -psc $psc
            Get-VmSnapShot $vm -name "Delete-me" | remove-vmSnapShot -wait -force:$force -psc $psc -ErrorAction silentlycontinue
        }
    }
}