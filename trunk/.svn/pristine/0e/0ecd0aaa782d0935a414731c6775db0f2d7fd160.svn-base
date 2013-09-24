$lstr_DriveNotFound = "Could not add disk - could not find or create drive for it"

Function Add-VMDisk
{# .ExternalHelp  MAML-VMDisk.XML
  [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(ParameterSetName="Path", position=0 , Mandatory = $true, ValueFromPipeline = $true)]
        $VM,
        
        [parameter(ParameterSetName="Path", position=1)]
        [int]$ControllerID = 0,
        
        [parameter(ParameterSetName="Path", position=2)]
        [int]$LUN = 0 ,
        
        [parameter(Mandatory = $true, position=3)][Alias("VHDPath","ISOPath","Fullname")]
        $Path,    
        
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()] 
        $Server="." , #May need to look for VM(s) on Multiple servers
        
        [parameter(ParameterSetName="Path")]
        [switch]$SCSI, 
        
        [parameter(ParameterSetName="Drive")]
        $DriveRASD,
                

        [Alias("DVD")]
        [switch]$OpticalDrive,

        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($pscmdlet.ParameterSetName -eq "Path") {
            if ($VM -is [String]) {$VM       =(Get-VM -Name $VM -server $Server) }
            if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-VMDisk -VM $_ @PSBoundParameters}}
            if ($VM.__CLASS -eq 'Msvm_ComputerSystem') {
                $DriveRASD = Get-VMDiskController -vm $vm -ControllerID $ControllerID -SCSI:$scsi -IDE:$(-not $scsi) | Get-VMDriveByController  -Lun $Lun 
                if (-not $driveRASD)  { $DriveRASD = Add-vmdrive -VM $vm -ControllerID $controllerID -LUN $lun -Server $Server -OpticalDrive:$opticalDrive -SCSI:$scsi -PSC $PSC -Force:$force }
            }    
        }    
        if ($pscmdlet.ParameterSetName -eq "Drive") {$vm= get-vm $DriveRasd }
        if (($VM.__CLASS -eq 'Msvm_ComputerSystem') -and ($DriveRasd.__CLASS -eq 'Msvm_ResourceAllocationSettingData')) { 
            Write-Debug "Before resolution Path of VHD to mount is $Path"
            if ($path -is [System.IO.FileInfo])       {$MountPath = $Path.fullName                }
            if ($Path -is [scriptblock])              {$MountPath = Invoke-Expression ".{$Path}"  } 
            if ($Path -is [String])                   {$MountPath = $path}
            if ($OpticalDrive) {$diskRASD = New-VMRasd -resType ([ResourceType]::StorageExtent) -resSubType 'Microsoft Virtual CD/DVD Disk' -Server $VM.__Server 
                                if ($mountPath -match "^\w:$")  {
                                                       $mountPath  = (Get-WmiObject -ComputerName $vm.__SERVER -Query "Select * From win32_cdromdrive where Drive='$mountPath'").deviceID 
                                }
                                else {Get-WmiObject -ComputerName $vm.__SERVER -Query "Select * From win32_cdromdrive" | ForEach-Object -begin {$CDDevices=@()} -process {$CDdevices += $_.deviceID}
                                      if (($mountPath -notmatch "iso$") -and ($CDdevices -notcontains $mountPath)) {
                                                       $mountPath += ".ISO"
                                      }
                                }
	        } 
            else                {$diskRASD = New-VMRasd -resType ([ResourceType]::StorageExtent) -resSubType 'Microsoft Virtual Hard Disk'   -Server $VM.__Server 
                                if ($mountPath -notmatch "VHD$") {
                                                       $mountPath += ".VHD"
                                }
            }
            if ($mountPath -notmatch "(\w:|\w)\\\w")  {$mountPath  =  (Get-VhdDefaultPath -server $diskRasd.__SERVER) + '\' +  $mountPath  }
            Write-Debug "After resolution Path of VHD to mount is $MountPath"
            $diskRASD.Connection = $mountPath
            $diskRASD.parent     = $DriveRasd.__Path 
            add-VmRasd -rasd $diskRasd -vm $vm -PSC $psc -force:$Force
        }
        elseif ($VM -isNOT [Array])  { write-warning $lstr_DriveNotFound }    
    } 
}