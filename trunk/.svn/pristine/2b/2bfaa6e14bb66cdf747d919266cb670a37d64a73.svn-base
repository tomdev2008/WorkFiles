$Lstr_removedDisk                  = "Removed disk from VM {0}"
$Lstr_diskRemoveFailed             = "Failed to remove disk from VM {0} result {1}" 
$lstr_RemoveHWSuccess              = "Removed {0} from {1}."
$lstr_RemoveHWFailure              = "Failed to remove {0} from {1}, return code {2}."
$lstr_RemoveHW                     = "Remove {0}" 
$lStr_VirtualMachineName           = "VM: {0}"


Function Remove-VMDrive
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param(
        [parameter(ParameterSetName="Path", Mandatory = $true, ValueFromPipeLine = $true, position=0)] 
        $VM, 
        
        [parameter(ParameterSetName="Path", Mandatory = $true, position=1)]
        [int]$ControllerID, 
        
        [parameter(ParameterSetName="Path", Mandatory = $true, position=2)]
        [int]$LUN, 

        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()] 
        $Server="." ,   #May need to look for VM(s) on Multiple servers
        
        [parameter(ParameterSetName="Path")]
        [switch]$SCSI, 
        
        [parameter(ParameterSetName="Drive")]
        $DriveRASD,
        
        [switch]$Diskonly,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet}  ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($pscmdlet.ParameterSetName -eq "Path") {
            if ($VM -is [String]) {$VM=(Get-VM -Name $VM -server $Server) }
            if ($VM.count -gt 1 )   { [Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Remove-VMDrive -VM $_  @PSBoundParameters}}
            if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {$DriveRASD = Get-VMDiskController -vm $vm -ControllerID $ControllerID -SCSI:$SCSI -IDE:$(-not $scsi) |
                                                                            Get-VMDriveByController -Lun $Lun }
            else       {$DriveRASD=(Get-VMDriveByController -controller (Get-VMDiskController -vm $vm -ControllerID $ControllerID -IDE)  -Lun $lun )}
        }
        # if ($pscmdlet.ParameterSetName -eq "Drive") {$vm= get-vm $driveRasd }  
        if ($DriveRASD.__CLASS -eq 'Msvm_ResourceAllocationSettingData')  {
            get-vmdiskByDrive $DriveRASD | foreach-object { if ($_ -ne $DriveRASD) { remove-VMRASD -psc $psc -force:$force -rasd $_ }  #Exclude Passthrough disks
            if (-not $diskOnly)                                                    { remove-VMRASD -psc $psc -force:$force -rasd $DriveRASD } }      
        }
    }	
}