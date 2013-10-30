$lstr_RemoveHWSuccess              = "Removed {0} from {1}."
$lstr_RemoveHWFailure              = "Failed to remove {0} from {1}, return code {2}."
$lstr_RemoveHW                     = "Remove {0}" 
$lStr_VirtualMachineName           = "VM: {0}"


Function Remove-VMFloppyDisk
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)] 
        $VM, 
        
        [ValidateNotNullOrEmpty()] 
        [string]$Server="." ,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) { $VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 )  { [Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Remove-VMFloppyDisk -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $floppyRASD = Get-VmFloppyDisk -VM $vm -Server $Server
            if ($floppyRASD) {remove-VMRasd -VM $vm -rasd $floppyRASD -PSC $psc -force:$force } 
        }
	}
}