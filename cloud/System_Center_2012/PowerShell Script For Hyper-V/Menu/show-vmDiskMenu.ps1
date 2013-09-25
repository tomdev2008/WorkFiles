
Function Show-VMDiskMenu 
{<#
    .SYNOPSIS
        Displays a menu to manage an individual VM's disks
   .PARAMETER VM
        The virtual Machine to manage
   .PARAMETER VMSCSI
        The SCSI controllers on the VM
   .PARAMETER VMDisk
        The disks controllers on the VM     
#>
param ($vm , $vmScsi , $vmdisk)                    
    $hiBack= $host.UI.RawUI.ForegroundColor
    $hiFore= $host.UI.RawUI.BackgroundColor
    if ($hiFore -eq -1) {$hiFore = ($HiBack -bxor 15)}    
    do { 
        $ChangeScsiHD=([boolean][int](Get-WmiObject -computerName $vm.__server -class "win32_operatingsystem").version.split(".")[1] ) -and  ($vmScsi.count -ge 1) 
        $dvdDrivePresent = [boolean]($vmdisk  | where {$_.driveName -like "DVD*"}) 
        if ($vm.EnabledState -eq [vmstate]::Stopped) {
            if ( ($vmdisk | where { $_.controllername -like "ide*" } | measure-object).count -lt 4)  {$AddIDEDrive = $true}
            if (  [boolean]($vmdisk | where {$_.controllername -like "ide*"}))                       {$ChangeIDEDrive = $true}
            if (  $vmScsi.count -ge 1 ) { $ChangeScsiHD = $true }
        }   
        if ($host.name -notmatch "\sISE\s") {
                               $heading = "Configuring Disk for VM : $($VM.ElementName) on server $($VM.__Server)"
                               $heading=(("-" * ($host.ui.RawUI.WindowSize.width-1)) + "`n" + ("|"+$heading.Padleft(($heading.length / 2) + 
                                         ($host.ui.RawUI.WindowSize.width /2))).padright($host.ui.RawUI.WindowSize.width -2) +"|") + "`n" + 
                                         (("-" * ($host.ui.RawUI.WindowSize.width-1))
                                        ) + "`n"
                               Clear-host
                               write-host -ForegroundColor $hifore -BackgroundColor $hiBack $heading
        }
        else                  {Write-host   "     -------------------------------------------------------------------------------"
                               write-host   "           Configuring Disk for VM : $($VM.ElementName) on server $($VM.__Server)"
                               write-host   "     -------------------------------------------------------------------------------`n"
        }
        $vmdisk | format-table -AutoSize -Property  ControllerName, DriveLun, driveName, diskimage  
        If  ($ChangeScsiHD)    {Write-host  "[ 1] Add Hard drive to a SCSI Contoller  "}         else {write-host   "[--] -----"}
        If  ($ChangeScsiHD -and ($vmdisk | 
              where {$_.controllername -like "*SCSI*"})) {
                               Write-host   "[ 2] Change disk image attached to SCSI hard drive"
                               Write-host   "[ 3] Remove SCSI Drive" }                           else {write-host   "[--] -----`n[--] -----"
        }
        if  ($AddIDEDrive)     {Write-host "`n[ 4] Add a Hard drive to an IDE Controller "}      else {write-host "`n[--] -----"}
        if  ($ChangeIDEDrive ) {Write-host   "[ 5] Change disk image attached to IDE hard drive"
                                Write-host   "[ 6] Remove IDE Hard drive or IDE DVD drive"}      else {write-host   "[--] -----`n[--] -----"}
        if  ($AddIDEDrive)     {Write-host "`n[ 7] Add IDE DVD drive"}                           else {write-host   "[--] -----"}
        if  ($dvdDrivePresent) {Write-host   "[ 8] Change disk (image) attached to DVD drive"}   else {write-host   "[--] -----"}
                                Write-host   "[10] Manage VHD files"  
                                Write-host "`n[99] Return to previous menu`n"
        $selection =       [int](read-host   "     Please select an option "  )
        switch ($selection) {
            1  { $controller = $vmscsi | select-list -Property @{Name="Controller"; expression={$_.ElementName}},
                                                               @{Name="Drive(s) Attached";expression={(Get-VMDriveByController $_ | measure-Object).count}}
                 if ($controller) { 
                    Get-VMDriveByController $controller | foreach -begin {$addresses = @() } -process {$addresses += $_.address }
                    do { $lun= Read-host "Please enter the LUN for the new disk" 
                         if ($addresses -Contains $lun) {write-host "That lun is already in use"}
                       }  until ($addresses -notContains $Lun)
                    $respool = get-wmiobject -Namespace root\virtualization -query "Select * from Msvm_ResourcePool where ResourceSubType = 'Microsoft Physical Disk Drive'"
                    $hostPassThroughDisks= (get-wmiobject -Namespace root\virtualization -query "associators of {$respool} where resultClass=Msvm_DiskDrive" )
                    if ($lun -and $hostPassThroughDisks ) {
                          $passThrough = Select-Item -TextChoices @("&VHD File","&Physical Disk") -Caption "Connecting Hard drive" -Message "Do wish to connect the new disk to"
                    }
                    if ($passThrough) {Add-VMPassThrough -LUN $lun -ControllerRASD $controller -PhysicalDisk (Select-List -InputObject $hostPassThroughDisks -Property @("elementName") )}
                    Elseif ($lun)     { 
                        $drive  =  Add-VMDrive -Confirm  -ControllerRASD $controller -LUN ($lun.replace("Lun ",""))
                        if ($drive)  {$Path = Read-host "Please enter a path to the image to mount in the new drive"
                                      If ($path) {Add-VMDisk -DriveRASD $drive -Path $path | out-null } 
                        }
                    } 
                 }    
               } 
            3  { $DriveID =  ($vmDisk | where {$_.controllerName -like "*SCSI*"} | 
                                  Select-List -Property ControllerName,DriveLun,drivename,DiskImage).DriveInstanceID.replace("\","\\") 
                 if ($DriveID) {$wql= "select * from MSVM_ResourceAllocationSettingData where instanceId='$DriveID' " 
                                Remove-VMRasd -VM $vm -rasd (Get-WmiObject -ComputerName $vm.__SERVER -Namespace $HyperVNamespace -Query $WQL) -Confirm
                 }
               }    
            6  { $DriveID =  ($vmDisk | where {$_.controllerName -like "*IDE*"} | 
                                    Select-List -Property ControllerName,DriveLun,drivename,DiskImage).DriveInstanceID.replace("\","\\") 
                 if ($DriveID) {$wql= "select * from MSVM_ResourceAllocationSettingData where instanceId='$DriveID' " 
                                Remove-VMRasd -VM $vm -rasd (Get-WmiObject -ComputerName $vm.__SERVER -Namespace $HyperVNamespace -Query $WQL) -Confirm
                 }
               }
            {@(2,5,8) -contains $_}
               { if ($_ -eq 2) {$DriveID =  ($vmDisk | where {$_.controllerName -like "*SCSI*"} | 
                                    Select-List -Property ControllerName,DriveLun,drivename,DiskImage).DriveInstanceID.replace("\","\\") 
                 }
                 if ($_ -eq 5) {$DriveID =  ($vmDisk | where {$_.controllerName -like "*IDE*" -and $_.DriveName -eq "Hard Drive"} | 
                                    Select-List -Property ControllerName,DriveLun,drivename,DiskImage).DriveInstanceID.replace("\","\\")
                 }
                 if ($_ -eq 8) {$DriveID =  ($vmDisk | where  {$_.DriveName -eq "DVD Drive"} | 
                                    Select-List -Property ControllerName,DriveLun,drivename,DiskImage).DriveInstanceID.replace("\","\\")              
                 }
                 if ($DriveID) {$Path = Read-host "Please enter a path to the new image to mount in the drive"
                                $wql= "select * from MSVM_ResourceAllocationSettingData where instanceId='$DriveID' " 
                                $drive=(Get-WmiObject -ComputerName $vm.__SERVER -Namespace $HyperVNamespace -Query $WQL)     
                                if ($path)  {if (Get-VMDiskByDrive -Drive $drive) {Set-VMDisk -DriveRASD $drive -Path $path -Confirm | out-null }
                                             else                                 {add-vmDisk -DriveRASD $drive -Path $path -OpticalDrive:$($_ -eq 8) -Confirm | out-null }
                                }
                                elseif ($_ -eq 8 -and (Get-VMDiskByDrive -Drive $drive)) { write-host "Removing Optical disk from the drive."
                                                                                           Remove-VMdrive -DriveRASD $drive -Diskonly 
                                }
                 }
               }
            {@(4,7) -contains $_ } 
               { $optical = [boolean]($_ -eq 7)
                 if (-not $optical) {Write-host -ForegroundColor red "If you need to create a VHD file, go back to the previous menu to do so"}    
                 $controller = (Get-VMDiskController -ide -vm $vm | 
                     where-object {(Get-VMDriveByController $_ | measure-Object).count -lt 2} | 
                         Select-List -Property @{Name="Controller"; expression={$_.ElementName}}  )
                 if ($controller) {
                     Get-VMDriveByController $controller |  foreach -begin {$addresses = @() }  -process {$addresses += $_.address } 
                     $lun = ($(foreach ($l in (0..1 | where {$addresses -notContains $_} )) {
                                    Add-Member -InputObject ( New-Object -TypeName System.Object ) -PassThru -name lun -MemberType noteproperty -Value $l |  
                                        Add-Member -PassThru -name lunName -MemberType noteproperty -Value "Lun $l" }) |  select-list -property @("LunName")).lun
                     $path = $null 
                     $respool = get-wmiobject -Namespace root\virtualization -query "Select * from Msvm_ResourcePool where ResourceSubType = 'Microsoft Physical Disk Drive'"
                     $hostPassThroughDisks= (get-wmiobject -Namespace root\virtualization -query "associators of {$respool} where resultClass=Msvm_DiskDrive" )
                     if (-not $optical -and $hostPassThroughDisks ) {
                          $passThrough = Select-Item -TextChoices @("&VHD File","&Physical Disk") -Caption "Connecting Hard drive" -Message "Do wish to connect the new disk to"
                     }
                     if ($passThrough) {Add-VMPassThrough -Confirm -LUN $lun -ControllerRASD $controller -PhysicalDisk (Select-List -InputObject $hostPassThroughDisks -Property @("elementName") ) | out-null}
                     Else   {
                         $drive =  Add-VMDrive -Confirm -OpticalDrive:$optical  -ControllerRASD $controller -LUN $lun
                         if ($drive) { 
                              $hostOpticalDrives = Get-WmiObject -ComputerName $vm.__SERVER -Query "Select * From win32_cdromdrive"
                              if ($optical -AND $hostOpticalDrives) {
                                 switch (Select-Item -TextChoices @("&ISO File","&Physical Disk", "Decide &Later") -Caption "Connecting DVD drive" -Message "Do wish to connect the new disk to") {
                                     1 {$path=(Select-List -InputObject $hostOpticalDrives -Property ID,mediatype,caption).deviceID}
                                     0 {$Path = Read-host "Please enter a path to the image to mount in the new drive"}
                                 }
                              }
                              Else {$Path = Read-host "Please enter a path to the image to mount in the new drive"}
                              If   ($path) {Add-VMDisk -DriveRASD $drive -Path $path -OpticalDrive:$optical -confirm| out-null }
                              elseif (-not $optical) {$null = Read-host "It is not supported to have a hard disk without an image or pass through disk."} 
                         }                      
                     }                                                 
                 }
               } 
           10  {Show-vhdMenu $vm.__Server}                                                                               
       }
       $null = Read-host "Press [enter] to continue"
       [Object[]]$vmDisk = Get-VMDisk $vm
   } until ($selection -ge 20)
   
}