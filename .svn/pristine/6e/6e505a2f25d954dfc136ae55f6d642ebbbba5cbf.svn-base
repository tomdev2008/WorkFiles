$Lstr_RenameSnapShot = "Rename Snapshot"


Function Rename-VMSnapshot 
{# .ExternalHelp  MAML-VMSnapshot.XML
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact='High' )]
    param (
        [parameter(ParameterSetName="Path" ,Mandatory = $true)]
        $VM, 
        [parameter(ParameterSetName="Path" , Mandatory = $true)][ValidateNotNullOrEmpty()][Alias("SnapshotName")]
        [String]$SnapName, 
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()] 
        [string]$NewName, 
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()] 
        $Server=".",   #May need to look for VM(s) on Multiple servers
        [parameter(ParameterSetName="Snap" , Mandatory = $true, ValueFromPipeline = $true)]
        $Snapshot,
        $PSC,
        [switch]$Force 
    )    
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object { Rename-VMsnapshot -VM $_  @PSBoundParameters}} 
        if (($pscmdlet.ParameterSetName -eq "Path") -and ($vm.__CLASS -eq 'Msvm_ComputerSystem')) { $snapshot=Get-VmSnapshot -vm $vm -name $snapName }
        if ($snapshot.__class -eq 'Msvm_VirtualSystemSettingData') {Set-vm -VM $snapshot -Name $newName -psc $psc -force:$force }
    }     
}
