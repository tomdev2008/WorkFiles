import-module hyperv -force
Start-transcript
$errorActionPreference="Inquire" 
get-module
get-command -mod hyperv | get-help | ft -a name , synopsis | out-default
# uncomment to check for hosts in AD                                                 GET-VMHOST
                                                 new-vm                  "london","paris"                                                                                                                          |out-default
                                                 new-vm                   Oxford                                                                                                                                   |out-default
                                                 new-vm                  server1,server2                                                                                                                           |out-default
$Global:myvm     =                               new-vm                  -Name "tenby"                                                                                                                             
                   "Core-1","Core-2","Core-3"  | new-vm                                                                                                                                                   -whatif  
$Global:threeVMs = "Core-1","Core-2","Core-3"  | new-vm                                                                                                                                                            
                                                 get-vm                                                                                                                                                            |out-default
                   "Core-1","Core-2","Core-3"  | get-vm                                                                                                                                                            |out-default
                                                 Get-vm                  London,Paris                                                                                                                              |out-default
                                                 set-vm                  $myVM                  -autoStart    AlwaysStartup                                                                                        |out-default
                                                 set-vm                  London,paris           -AutoShutDown ShutDown                                                                                             |out-default
get-vm server*                                 | set-vm                                         -autoStart    AlwaysStartup -autoDelay 100                                                                         |out-default
      "Oxford"                                 | set-vm                                         -Note "Here be dragons"                                                                                            |out-default
                                                 Set-vm                  $threeVMs              -bootorder CD,IDE,net,Floppy                                                                              -whatif  
                                                 Set-vm                  $threeVMs              -bootorder CD,IDE,net,Floppy                                                                                       |Out-Default
get-vm server*                                 | Set-VMCPUCount                                 -CPUCount 2                                                                                                        |Out-Default
      "Oxford" |                                 Set-VMCPUCount                                 -CPUCount 2                                                                                                        |Out-Default
                                                 Set-VMCPUCount          -vm london,paris       -CPUCount 2                                                                                                        |Out-Default
Write-Output "Following line should produce a warning" 
                                                 Set-VMCPUCount          $myVM                  -CPUCount 2 -Limit 99                                                                                              |Out-Default 
                                                 Set-VMCPUCount          $myVM                  -CPUCount 2 -Limit 99000 -reservation 1000                                                                         |Out-Default
                                                 Set-VMCPUCount          $threeVMs              -CPUCount 1                                                                                               -whatif
                                                 Set-VMCPUCount          $threeVMs              -CPUCount 2                                                                                                        |Out-Default 
                                                 Get-vmCpuCount                                                                                                                                                    |Out-Default 
get-vm server*                                 | Get-VMCPUCount                                                                                                                                                    |Out-Default
      "Oxford"                                 | Get-VMCPUCount                                                                                                                                                    |Out-Default
                                                 Get-VMCPUCount          $myVM                                                                                                                                     |Out-Default
                                                 Get-VMCPUCount          $ThreeVMs                                                                                                                                 |Out-Default
"Oxford"                                       | Set-VMMemory                                   -Memory 512                                                                                                        |Out-Default
get-vm server*                                 | Set-VMMemory                                   -Memory 512mb                                                                                                      |Out-Default
                                                 Set-VMMemory            -vm $myvm              -Memory 512mb                                                                                                      |Out-Default
                                                 Set-VMMemory            -vm london,paris       -Memory 512mb                                                                                                      |Out-Default
                                                 Set-VMMemory            -vm $threeVMs          -Memory 512mb                                                                                             -whatif
                                                 Set-VMMemory            $threeVMs              -Memory 512mb                                                                                                      |Out-Default
                                                 Get-vmMemory                                                                                                                                                      |Out-Default
get-vm server*                                 | Get-VMMemory                                                                                                                                                      |Out-Default
      "Oxford"                                 | Get-VMMemory                                                                                                                                                      |Out-Default
                                                 Get-VMMemory            $myVM                                                                                                                                     |Out-Default
                                                 Get-VMMemory            London,Paris                                                                                                                              |Out-Default
                                                 Get-VMMemory            $ThreeVMs                                                                                                                                 |Out-Default
"Oxford"                                       | Set-VMMemory                                   -Limit 2048 -buffer 25 -weight 8000 -dynamic                                                                       |Out-Default
get-vm server*                                 | Set-VMMemory                                   -Limit 2GB  -buffer 25 -weight 8000 -dynamic                                                                       |Out-Default
                                                 Set-VMMemory            -vm $myvm              -Limit 2GB  -buffer 25 -weight 8000 -dynamic                                                                       |Out-Default
                                                 Set-VMMemory            -vm london,paris       -Limit 2gb  -buffer 25 -weight 8000 -dynamic                                                                       |Out-Default
                                                 Set-VMMemory            -vm $threeVMs          -Limit 2GB  -buffer 25 -weight 8000 -dynamic                                                             -whatif
                                                 Set-VMMemory            $threeVMs              -Limit 2GB  -buffer 25 -weight 8000 -dynamic                                                                       |Out-Default
                                                 Get-vmMemory                                                                                                                                                      |Out-Default
get-vm server*                                 | Get-VMMemory                                                                                                                                                      |Out-Default
      "Oxford"                                 | Get-VMMemory                                                                                                                                                      |Out-Default
                                                 Get-VMMemory            $myVM                                                                                                                                     |Out-Default
                                                 Get-VMMemory            London,Paris                                                                                                                              |Out-Default
                                                 Get-VMMemory            $ThreeVMs                                                                                                                                 |Out-Default
      "Oxford"                                 | Add-VMRemoteFXController                                                                                                                                          |Out-Default
                                                 Add-VMRemoteFXController $myVM                                                                                                                                    |Out-Default
                                                 Add-VMRemoteFXController London,Paris                                                                                                                             |Out-Default
                                                 Add-VMRemoteFXController $ThreeVMs                                                                                                                                |Out-Default
      "Oxford"                                 | Get-VMRemoteFXController                                                                                                                                          |Out-Default
                                                 Get-VMRemoteFXController $myVM                                                                                                                                    |Out-Default
                                                 Get-VMRemoteFXController London,Paris                                                                                                                             |Out-Default
                                                 Get-VMRemoteFXController $ThreeVMs                                                                                                                                |Out-Default
      "Oxford"                                 | Set-VMRemoteFXController                       -Monitors 2                                                                                                        |Out-Default
                                                 Set-VMRemoteFXController $myVM                 -Monitors 2                                                                                                        |Out-Default
                                                 Set-VMRemoteFXController London,Paris          -Monitors 2                                                                                                        |Out-Default
                                                 Set-VMRemoteFXController $ThreeVMs             -Monitors 2                                                                                                        |Out-Default
                                                 Get-VMRemoteFXController                                                                                                                                          |Out-Default
                                                 Set-VMRemoteFXController -RFXRASD (Get-VMRemoteFXController) -Resolution 3                                                                                        |Out-Default
                                                 
"Oxford"                                       | add-vmnic                                                                                                                                                         |Out-Default
"Oxford"                                       | add-vmnic                                      -legacy  -Virtualswitch $(Get-VMSwitch | select -First 1)                                                          |Out-Default
get-vm server*                                 | add-vmnic                                      -legacy                                                                                                            |Out-Default
                                                 Add-VMNIC               london,paris                                                                                                                              |Out-Default
                                                 Add-VMNIC               $myvm                          -mac 00155d1d3e31                                                                                          |Out-Default
                                                 Add-VMNIC               $threeVMs                                                                                                                                 |Out-Default
                                                 Add-VMNIC               london,paris           -legacy                                                                                                            |Out-Default
                                                 Add-VMNIC               $threeVMs              -legacy                                                                                                    -whatif             
                                                 Add-VMNIC               $threeVMs              -legacy                                                                                                            |Out-Default
                                                 get-vmNic                                                                                                                                                         |Out-Default
get-vm server*                                 | Get-VMNic                                                                                                                                                         |Out-Default
      "Oxford"                                 | Get-VMNic                                                                                                                                                         |Out-Default
                                                 Get-VMNic               $myVM                                                                                                                                     |Out-Default
                                                 Get-VMNic               $ThreeVMs                                                                                                                                 |Out-Default
                                                 Get-VMNic               London,Paris                                                                                                                              |Out-Default
"Oxford"                                       | Set-VMSerialPort                               -port 1 -connection "\\.\pipe\WIBBLE"                                                                              |Out-Default
get-vm server*                                 | Set-VMSerialPort                               -port 1 -connection "\\.\pipe\WIBBLE"                                                                              |Out-Default
                                                 Set-VMSerialPort        -vm $myvm              -port 1 -connection "\\.\pipe\WIBBLE"                                                                              |Out-Default
                                                 Set-VMSerialPort        -vm london,paris       -port 1 -connection "\\.\pipe\WIBBLE"                                                                              |Out-Default
                                                 Set-VMSerialPort        -vm $threeVMs          -port 1 -connection "\\.\pipe\WIBBLE"                                                                     -whatif
                                                 Set-VMSerialPort        -vm $threeVMs          -port 1 -connection "\\.\pipe\WIBBLE"                                                                              |Out-Default
                                                 get-VMSerialPort                                                                                                                                                  |Out-Default
get-vm server*                                 | Get-VMSerialPort                                                                                                                                                  |Out-Default
      "Oxford"                                 | Get-VMSerialPort                                                                                                                                                  |Out-Default
                                                 Get-VMSerialPort        $myVM                                                                                                                                     |Out-Default
                                                 Get-VMSerialPort        $ThreeVMs                                                                                                                                 |Out-Default
                                                 Get-VMSerialPort        London,Paris                                                                                                                              |Out-Default
"Oxford"                                       | Set-VMSerialPort                               -port 1 -connection $null                                                                                          |Out-Default
get-vm server*                                 | Set-VMSerialPort                               -port 1 -connection ""                                                                                             |Out-Default
                                                 Set-VMSerialPort        -vm $myvm              -port 1 -connection $([String]::empty)                                                                             |Out-Default
                                                 Set-VMSerialPort        london,paris           -port 1 -connection ""                                                                                             |Out-Default
                                                 Set-VMSerialPort        $threeVMs              -port 1 -connection ""                                                                                             |Out-Default
get-vm server*                                 | Add-VMSCSIController                           -name "VMBUS SCSI Controller 0"                                                                                    |Out-Default
                                                 Add-VMscsicontroller    london,paris                                                                                                                              |Out-Default
                                                 Add-VMscsicontroller    $myVm                                                                                                                                     |Out-Default
"oxford"                                       | Add-VMscsicontroller                                                                                                                                              |Out-Default
                                                 Add-VMscsicontroller    $threeVms                                                                                                                        -whatif
                                                 Add-VMscsicontroller    $threeVms                                                                                                                                 |Out-Default
	                                             Get-VMDiskController                           -SCSI                                                                                                              |Out-Default
get-vm server*                                 | Get-VMDiskController                           -SCSI                                                                                                              |Out-Default
"Oxford"                                       | Get-VMDiskController                           -SCSI                                                                                                              |Out-Default
                                                 Get-VMDiskController    $myVM                  -SCSI                                                                                                              |Out-Default
                                                 Get-VMDiskController    $ThreeVMs              -SCSI                                                                                                              |Out-Default
                                                 Get-VMDiskController    "Lo*","Pa*"            -SCSI                                                                                                              |Out-Default
Write-host ("Default VHD Path is {0}" -f $(      Get-VhdDefaultPath      ) )                                                                                                                                       
"oxford"                                       | new-vfd                                                                                                                                                                -wait     |Out-Default
                                                 new-vfd                 $myvm.ElementName                                                                                                                              -wait  |Out-Default
"core-1","Core-2","core-3"                     | new-vfd                                                                                                                                                           |Out-Default
                                                 New-VfD                 "London","Paris"                                                                                                                          |Out-Default
                                                 Add-VMFloppyDisk        -VM $myvm              -Path tenby                                                                                                        |Out-Default  
                                                 Add-VMFloppyDisk        -VM "London"           -Path D:\VHDs\London.VFD                                                                                           |Out-Default
"oxford"                                       | Add-VMFloppyDisk                               -Path oxford                                                                                                       |Out-Default
get-vm server*                                 | Add-VMFloppyDisk                               -Path core-1                                                                                                       |Out-Default
                                                 Get-VMFloppyDisk                                                                                                                                                  |Out-Default
get-vm server*                                 | Get-VMFloppyDisk                                                                                                                                                  |Out-Default
"Oxford"                                       | Get-VMFloppyDisk                                                                                                                                                  |Out-Default
                                                 Get-vmFloppyDisk        $MyVM,"London"                                                                                                                            |Out-Default
                                                 Add-NewVMHardDisk       $myVM                                                                                                                                     |Out-Default
####### Ensure correct paths for the next two lines                                                 
                                                 Add-VMDisk              $myvm                  -ControllerID 0 -lun 1 -OpticalDrive -Path "C:\Windows\System32\vmguest.iso"                                       |Out-Default
                                                 Set-VMDisk              $myvm                  -ControllerID 0 -lun 1 "E:"                                                                                        |Out-Default 
                                                 New-VHD                 "London","Paris"                                                                                                                          |Out-Default
"core-1","Core-2","core-3"                     | new-vhd                                        -Size 2gb -Fixed                                                                                                        -Wait        |Out-Default
"oxford"                                       | new-vhd                                                                                                                                                                -wait      |Out-Default
"Server1","Server2"                            | new-vhd                                        -parent Oxford.vhd                                                                                                      -wait      |Out-Default
                                                 get-vhd                 (Get-VhdDefaultPath)                                                                                                                      |Out-Default
                                                 get-vhd                                                                                                                                                           |Out-Default
 get-vhd                                       | Get-vhdInfo                                                                                                                                                       |Out-Default
####### Ensure correct path for get-vhdinfo and test VHD
 dir d:\vhds\*.vhd                             | get-vhdinfo                                                                                                                                                       |Out-Default
                                                 Get-VHDInfo             london,paris                                                                                                                              |Out-Default
                                                 Get-VHDInfo             $myvm.ElementName                                                                                                                         |Out-Default
                                                 Get-VHDInfo             D:\vhds\core-1.VHD                                                                                                                        |Out-Default
get-vhd                                        | test-vhd                                          -verbose                                                                                                        |Out-Default
dir D:\VHDs                                    | test-vhd                                          -verbose                                                                                                        |Out-Default
                                                 test-vhd                D:\VHDs\core-1.VHD        -verbose                                                                                                        |Out-Default
                                                 test-vhd                core-1.VHD                -verbose                                                                                                        |Out-Default
                                                 test-vhd                core-1                    -verbose                                                                                                        |Out-Default
                                                 Test-vhd                tenby,london,paris        -verbose                                                                                                        |Out-Default
#should run in the background 
get-vhd                                        | get-vhdinfo                                    | where {$_.typename -eq "dynamic"} | select -First 2                  | compact-vhd      -verbose                 |Out-Default
get-vhd                                        | get-vhdinfo                                    | where {$_.typename -eq "dynamic"} | select -last  2                  | compact-vhd                      -WhatIf
get-vhd                                        | get-vhdinfo                                    | where {$_.typename -eq "dynamic"} | select -first 3 | select -last 1 | compact-vhd        -verbose                            -wait |Out-Default 
### Ensure correct path
                                                                         dir d:\vhds\ten*.vhd                                                                          | compact-vhd                      -WhatIf
                                                 expand-vhd              core-1                 -Size 2.5gb                                                                    -verbose                                     |Out-Default 
                                                 expand-vhd              core-2                 -Size 2.5gb                                                                    -verbose                                         -Wait |Out-Default
                                                 expand-vhd              core-3                 -Size 2.5gb                                                                                               -WhatIf
write-output "THe following command should warn 'too small' error"
                                                 expand-vhd              core-3                 -Size 0.5gb                                                                    -verbose
write-output "THe following command should produce a 'drive needs to be expanded not reduced' error"
                                                 expand-vhd              core-3                 -Size 1.5gb                                                                     -verbose
                                                 expand-vhd              london,paris,tenby     -Size 130gb                                                                     -verbose                           |Out-Default
                                                 new-vhd                 -VHDPath test          -Size 1gb                                                                       -verbose                                        -Wait |Out-Default    
                                                 Convert-VHD             -VHDPath test          -DestPath test2 -Type Fixed                                                     -verbose                                        -Wait |Out-Default
                                                 new-vhd                 -VHDPath test3,test4   -parent   test                                                                  -verbose                                        -Wait |Out-Default    
                                                 Convert-VHD             -VHDPath test4         -DestPath test5 -Type dynamic                                                   -verbose                                        -wait |Out-Default    
## ensure correct path
dir d:\vhds\test*                              | get-vhdinfo                                                                                                                                                        |Out-Default    
ren D:\vhds\test.VHD test-test-test.vhd
#Should report the parent was not found
                                                 test-vhd                test3                                                                                                   -verbose                           |Out-Default    
                                                 Connect-VHDParent       test3                  -ParentPath D:\VHDs\test-test-test.vhd                                           -verbose                           |Out-Default    
                                                 test-vhd                test3                                                                                                   -verbose                           |Out-Default    
                                                 get-vhdinfo             test3                                                                                                   -verbose                           |Out-Default     
                                                 mount-vhd               test3                  -offline                                                                         -verbose                           |Out-Default    
                                                 Add-VMDrive             $threevms              -ControllerID 0 -LUN 0                                                                                              |Out-Default                      
get-vm server*                                 | Add-VMDrive                                    -ControllerID 0 -LUN 0                                                                                              |Out-Default    
                                                 Add-VMDrive             -vm london,paris       -ControllerID 0 -LUN 0                                                                                              |Out-Default    
                                                 Add-VMDrive             -vm london,paris       -ControllerID 0 -LUN 1 -OpticalDrive                                                                                |Out-Default     
#Test adding disksithout creating drives first  
#"oxford"                                      | Add-VMDrive                                    -ControllerID 0 -LUN 0 
#get-vm server*                                | Add-VMDrive                                    -ControllerID 0 -LUN 1 -OpticalDrive
 "oxford"                                      | Add-VMDrive                                    -ControllerID 0 -LUN 1 -OpticalDrive                                                                                |Out-Default    
                                                 Add-VMDrive             $threevms              -ControllerID 0 -LUN 1 -OpticalDrive                                                                      -whatif
                                                 Add-VMDrive             $threevms              -ControllerID 0 -LUN 1 -OpticalDrive                                                                                |Out-Default                                                        
### Ensure correct paths 
"oxford","london","paris" | foreach {            add-vmdisk              -VM $_                 -ControllerID 0 -LUN 0               -Path "d:\vhds\$_.vhd"}                                                        |Out-Default    
get-vm server*            | foreach {            add-vmdisk              -VM $_                 -ControllerID 0 -LUN 0               -Path $_.elementName}                                                          |Out-Default    
$threeVMs                 | foreach {            add-vmdisk              -VM $_                 -ControllerID 0 -LUN 0               -Path $_.elementName}                                                          |Out-Default      
"oxford"                  |                      Add-VMDisk                                     -ControllerID 0 -lun 1 -OpticalDrive -Path "C:\Windows\System32\vmguest.iso"                                        |Out-Default    
get-vm Server*            |                      Add-VMDisk                                     -ControllerID 0 -lun 1 -OpticalDrive -Path "C:\Windows\System32\vmguest.iso"                                        |Out-Default    
                                                 Add-VMDisk              $threeVMs              -ControllerID 0 -lun 1 -OpticalDrive -Path "C:\Windows\System32\vmguest.iso"                              -whatif
                                                 Add-VMDisk              $threeVMs              -ControllerID 0 -lun 1 -OpticalDrive -Path "C:\Windows\System32\vmguest.iso"                                        |Out-Default                  
Get-vm "London"                                | Add-VMDrive                                    -ControllerID 0 -LUN 0 -scsi                                                                                        |Out-Default    
"london"                                       | Add-vmdisk                                     -ControllerID 0 -LUN 0 -scsi         -Path "d:\vhds\Paris.vhd"                                                      |Out-Default    

                                                 Add-vmpassThrough       -vm "London"           -controllerID 0 -lun 1 -scsi         -physicalDisk (Select-VMPhysicalDisk)                                          |Out-Default    
                                                 Get-vmDisk                                                                                                                                                         |Out-Default    
get-vm server*                                 | Get-VMDisk                                                                                                                                                         |Out-Default    
      "Oxford"                                 | Get-VMDisk                                                                                                                                                         |Out-Default    
                                                 Get-VMDisk              $ThreeVMs                                                                                                                                  |Out-Default    
                                                 Get-VMDisk              $myVM                  | where {$_.diskName -like "hard*"}        | Get-VHDInfo                                                            |Out-Default    
get-vm core*                                   | GET-VMDISK                                     | where {$_.diskPath -match "vhd$"}        | get-vhdinfo                                                            |Out-Default                   
                                                 Get-VMDisk              -vm Tenby              | where {$_.diskName -like "hard*"}        | Expand-VHD -Size 10gb                                        -WhatIf
$oldvhd = get-vm $myVM                         | GET-VMDISK                                     | where-object {$_.diskpath -match "vhd$"} | get-vhdinfo                                                            |Out-Default    
                                                 new-vhd                 -VHDPath test6         -parentVHD $oldvhd                                                                                                     -wait | out-default
                                                 Get-VHDInfo             test6                                                                                                                                      |Out-Default    
                                                 new-vmsnapshot          $myVM                  -note "Testing: $(Get-Date)"                                                       -verbose               -force    |Out-Default 
                                                 new-vmSnapshot          $threeVMs              -note "Testing: $(Get-Date)"                                                       -verbose               -force       -wait |Out-Default 
Get-vm server*                                 | New-VmSnapshot                                 -note "Testing: $(Get-Date)"                                                                              -whatif
"oxford"                                       | New-VMSnapshot                                                                                                                    -verbose               -force    |Out-Default 
                                                 New-VMSnapShot          London, Paris                                                                                             -verbose               -force    |Out-Default 
                                                 Get-VMBuildScript       $myVM                  >  BScript.txt
                                                 Get-VMBuildScript       $threeVMs              >> BScript.txt 
Get-vm server*                                 | Get-VMBuildScript                              >> bScript.txt 
"oxford"                                       | Get-VMBuildScript                              >> bScript.txt 
                                                 Get-VMBuildScript       London, Paris          >> bScript.txt 
get-vm server*                                 | New-VMConnectSession
      "oxford"                                 | New-VMConnectSession
                                                 New-VMConnectSession    $myVM 
write-host "checking floppy disks"
                                                 Get-vmFloppyDisk                                                                                                                                                  |Out-Default 
                                                 remove-VMFloppyDisk     -VM $myvm                                                                                                  -verbose               -force
                                                 Remove-VMFloppyDisk     -VM "London"                                                                                               -verbose               -force
"oxford"                                       | Remove-VMFloppyDisk                                                                                                                -verbose               -force
get-vm server*                                 | Remove-vmFloppyDisk  															                                                    -verbose               -force
write-host "re-checking floppy disks"
                                                 Get-vmFloppyDisk                                                                                                                                                  | Out-Default              
                                                 get-vmdisk              london
"London"                                       | Remove-VMdrive                                 -controllerID 0 -LUN 0 -scsi                                                        -verbose               -force
get-vmdiskcontroller "london" -scsi            | get-vmDriveByController                        | foreach-Object {Remove-vmdrive -driveRASD $_ -force}
                                                 Get-vmDisk              london                                                                                                                                    |Out-Default    
                                                 Remove-VMSCSIController -vm london,paris       -controllerID 0                                                                     -verbose               -force
 get-vm server*                                | Remove-VMSCSIController                        -controllerID 0                                                                     -verbose               -force
 "oxford"                                      | Remove-VMSCSIController                        -controllerID 0                                                                     -verbose               -force
                                                 Remove-VMSCSIController                        -controllerID 0 -vm $myVm                                                           -verbose               -force
                                                 Remove-VMSCSIController                        -controllerID 0 -vm $threeVms                                                                             -whatif
                                                 Remove-VMSCSIController                        -controllerID 0 -vm $threeVms                                                       -verbose               -force
                                                 Get-vmNic                                      -legacy                                                                                                           | Out-Default                               
Get-vmNic -legacy                              | Remove-VMNIC                                                                                                                                             -whatif
Get-vmNic -legacy                              | Remove-VMNIC                                                                                                                       -verbose               -force
                                                 get-vmnic                                                                                                                                                        |Out-Default 
# Ensure correct path for exports. 
                                                 Export-VM               $myvm                  -path D:\exports                                                                                                        -wait 
                                                 Export-VM               "London","paris"       -path D:\Exports -copyState  -preserve                                                                                  -wait  
"oxford"                                       | Export-vm                                      -path D:\exports -copyState                                                                                             -wait
get-vm server*                                 | Export-vm                                      -path D:\exports             -preserve                                                                                  -wait  
get-vmsnapshot Paris                           | restore-vmSnapshot                                                                                                                -verbose               -force
get-vmSnapshot $myVM                           | Remove-VMSnapshot                                                                                                                 -verbose               -force
"oxford" | get-vmSnapshot                      | Remove-VMSnapshot                                                                                                                 -verbose               -force
get-vmsnapshot Paris                           | rename-vmSnapshot                              -newName  "Testing snapshot"                                                       -verbose               -force
                                                 update-vmsnapshot       -vm Paris              -snapname "Testing snapshot"                                                       -verbose               -force
                                                 Dismount-VHD            test3                                                                                                     -verbose               -force





Stop-Transcript
