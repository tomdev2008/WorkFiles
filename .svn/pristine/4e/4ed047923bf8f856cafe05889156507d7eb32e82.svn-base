

Function Get-VMDisk
{# .ExternalHelp  MAML-VMDisk.XML
    param(
        [parameter( ValueFromPipeline = $true)]
        $VM="%" , 
        
        [ValidateNotNullOrEmpty()] 
        $Server =".",      #May need to look for VM(s) on Multiple servers
        
        [switch]$snapshot)
    process {     
        if ($vm -is [String]) {$vm = get-vm -Name $vm -Server $Server}
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VMDisk -VM $_ @PSBoundParameters}}
        If ($VM.__CLASS -eq 'Msvm_ComputerSystem')  {
           if ($snapshot)        {$VM = (,$VM + (get-vmsnapshot $vm)  | Sort-Object -Property elementname) }
           foreach ($v in $vm) {
             foreach ($dc in (get-vmdiskcontroller -vm $v)) {
                 foreach ($drive in (Get-VMDriveByController -controller $dc)) {
                    if   ($drive.ResourceSubType -eq 'Microsoft Physical Disk Drive') {$drive | select-object -property `
                                                       @{name="VMElementName";        expression={$v.elementName}},
                                                       @{name="VMGUID";               expression={$v.Name}},
                                                       @{name="ControllerName";       expression={$dc.elementName}},
                                                       @{name="ControllerInstanceID"; expression={$dc.InstanceId}},
                                                       @{name="ControllerID";         expression={$dc.instanceID.split("\")[-1]}},
                                                       @{name="DriveName";            expression={"Passthrough Disk"}} ,
                                                       @{name="DriveInstanceID";      expression={$drive.instanceID}},
                                                       @{name="DriveLUN";             expression={$drive.address}},
                                                       @{name="DiskPath";             expression={"Physical drive: " + ([wmi]($drive.HostResource[0])).elementname}},
                                                       @{name="DiskImage";            expression={"Physical drive: " + ([wmi]($drive.HostResource[0])).elementname}},
                                                       @{name="DiskName";             expression={$_.ElementName}},
                                                       @{name="DiskInstanceID";       expression={$_.InstanceID}} 
                    }
                    else {$d= get-vmdiskByDrive -drive $drive 
                          if ($d) {$d | select-object -property `
                                                       @{name="VMElementName";        expression={$v.elementName}},
                                                       @{name="VMGUID";               expression={$v.Name}},
                                                       @{name="ControllerName";       expression={$dc.elementName}},
                                                       @{name="ControllerInstanceID"; expression={$dc.InstanceId}},
                                                       @{name="ControllerID";         expression={$dc.instanceID.split("\")[-1]}},
                                                       @{name="DriveName";            expression={$drive.caption}} ,
                                                       @{name="DriveInstanceID";      expression={$drive.instanceID}},
                                                       @{name="DriveLUN";             expression={$drive.address}},
                                                       @{name="DiskPath";             expression={$_.Connection}},
                                                       @{name="DiskImage";            expression={$p=$_.Connection[0] ; while ($p.toupper().EndsWith(".AVHD")) { $p=(Get-VHDInfo -vhdpath $p -Server $_.__server ).parentPath } ; $p}},
                                                       @{name="DiskName";             expression={$_.ElementName}},
                                                       @{name="DiskInstanceID";       expression={$_.InstanceID}} 
                          }
                          else  { $drive  | select-object -property `
                                                       @{name="VMElementName";        expression={$v.elementName}},
                                                       @{name="VMGUID";               expression={$v.Name}},
                                                       @{name="ControllerName";       expression={$dc.elementName}},
                                                       @{name="ControllerInstanceID"; expression={$dc.InstanceId}},
                                                       @{name="ControllerID";         expression={$dc.instanceID.split("\")[-1]}},
                                                       @{name="DriveName";            expression={$_.Caption}} ,
                                                       @{name="DriveInstanceID";      expression={$drive.instanceID}},
                                                       @{name="DriveLUN";             expression={$drive.address}},
                                                       @{name="DiskPath";             expression={$null}},
                                                       @{name="DiskImage";            expression={$null}},
                                                       @{name="DiskName";             expression={$null}},
                                                       @{name="DiskInstanceID";       expression={$null}} 
                                                       
                          }
                    }
                }
            }
         }   
        }
    }   
}
