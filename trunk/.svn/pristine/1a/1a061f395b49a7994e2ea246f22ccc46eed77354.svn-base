$Lstr_removedDisk = "Removed disk from VM {0}"
$Lstr_diskRemoveFailed               = "Failed to remove disk from VM {0} result {1}" 
$lstr_removedDrive                   = "Removed drive from VM {0}."
$lstr_DriveRemoveFailed              = "Failed to remove disk from VM {0} result {1}"
$Lstr_RemovedSCSI                    = "Removed VBBUS SCSI Controller from VM {0}"
$lstr_VMBusSCSIRemove                = "Remove VMBus SCSI Controller"
$lStr_VirtualMachineName             = "VM: {0}"


Function Remove-VMSCSIController
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)] 
        $VM, 
        
        [parameter(Mandatory = $true)]
        [int]$ControllerID,
        
        [ValidateNotNullOrEmpty()]  
        $Server=".",                    #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet}  ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Remove-VMSCSIcontroller -VM $_  @PSBoundParameters}}
        $controller= (Get-VMDiskController -vm $vm -ControllerID $ControllerID -SCSI)
        if ($Controller.__CLASS -eq 'Msvm_ResourceAllocationSettingData' ) {
	        # to Avoid leaving orphaned objects, find and remove the drives bound to the controller (and the disks inserted into them)
            foreach ($drive in (Get-VMDriveByController $controller)) {Remove-VMdrive -DriveRASD $drive -psc $PSC -force:$force } 
            remove-VMRasd -VM $vm -rasd $controller -PSC $psc -force:$force
        }
    }	
}
