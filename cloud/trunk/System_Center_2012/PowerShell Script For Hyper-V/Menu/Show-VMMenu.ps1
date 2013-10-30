

Function Show-VMMenu
{<#
    .SYNOPSIS
        Displays a menu to manage and individual VM
   .PARAMETER VM
        The virtual Machine to manage
   .PARAMETER Server
        If a VM Name is passed, the name of the server where it is found. By default the local computer
#>
   Param(
      [parameter(Position=0 , mandatory=$true, ValueFromPipeline = $true)]
      $VM ,
      
      $Server="." 
     )
    $hiBack= $host.UI.RawUI.ForegroundColor
    $hiFore= $host.UI.RawUI.BackgroundColor
    $Refreshneeded = $True
    if ($hiFore -eq -1) {$hiFore = ($HiBack -bxor 15)} 
    if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
    if ($vm.__CLASS -eq 'Msvm_ComputerSystem'){ do {    
          if ($RefreshNeeded) {
              Write-Progress -Activity "Configuring VM $($VM.ElementName) " -Status "Gathering Data" 
              $VMCG       = Get-vmClusterGroup $vm
              $vmsd       = Get-VMSettingData $vm  
              $VSGSD      = get-wmiobject  -computername $vm.__SERVER -namespace $HyperVNamespace  -Query "associators of {$vm} where resultclass=Msvm_VirtualSystemGlobalSettingData"
              $VMcpu      = Get-VMCPUCount $vm
              $vmMemory   = Get-VMMemory $vm  
              $VMFloppy   = Get-VMFloppyDisk $vm 
    [Object[]]$vmScsi     = Get-VMDiskController $vm -SCSI 
    [Object[]]$vmDisk     = Get-VMDisk $vm
              $vmComPort  = Get-VMSerialPort $vm 
              $vmNic      = Get-VMNic $vm
              $VmSnap     = Get-VMSnapshottree $vm
    [Object[]]$vmNic      = Get-VMNic $vm
              $vmICs      = Get-VMIntegrationComponent $vm
              $vmRFX      = Get-VMRemoteFXController $VM
              Write-Progress -Activity "Configuring VM $($VM.ElementName) " -Status "Gathering Data" -Completed
              $Refreshneeded = $false
          }                       
          if ($host.name -notmatch "\sISE\s") {
              $heading = "Configuring VM : $($VM.ElementName) on server $($VM.__Server)"
              $heading=(("-" * ($host.ui.RawUI.WindowSize.width-1)) + "`n" + ("|"+$heading.Padleft(($heading.length / 2) + ($host.ui.RawUI.WindowSize.width /2))).padright($host.ui.RawUI.WindowSize.width -2) +"|") + "`n" + (("-" * ($host.ui.RawUI.WindowSize.width-1))) + "`n"
              Clear-host
              write-host -ForegroundColor $hifore -BackgroundColor $hiBack $heading
         }
         else                               { 
              Write-host  "     -------------------------------------------------------------------------------"
              write-host  "               Configuring VM : $($VM.ElementName) on server $($VM.__Server)"
              write-host  "     -------------------------------------------------------------------------------"
         }
          write-host     ("[ 1] Change VM State          :                  [ {0,-61} ]"             -f [vmState]$vm.enabledState)
          write-host     ("[ 2] Rename                   :                  [ {0,-61} ]"             -f $vmsd.elementName)                    
          ([bootmedia[]]$vmsd.BootOrder) | % -begin {$b=""} -process {$b += $_.tostring() +", "} `
    -end {write-host     ("[ 3] Boot order               :                  [ {0,-61} ]"             -f ($b -replace ", $",""))}
          write-host     ("[ 4] Notes                    :                  [ {0,-61} ]"             -f $vmsd.NOTES)
          write-host     ("[ 5] Recovery and             :                  [ On service fail:{0,-16}, On Host shutdown:{1,-10} ]"`
                                                                                                    -f [RecoveryAction]$vsgsd.AutomaticRecoveryAction ,
                                                                                                        [ShutdownAction]$vsgsd.AutomaticShutdownAction) 
          write-host     ("     Startup options                             [ On Host boot   :{0,-16}, Delay {1,4} seconds          ]" `
                                                                                                    -f [StartUpAction]$vsgsd.AutomaticStartupAction, 
                                                                                                       [System.Management.ManagementDateTimeconverter]::ToTimeSpan($VSGSD.AutomaticStartupActionDelay).Seconds )
          write-host     ("[ 6] Snapshots                :")                                         
          $VmSnap | foreach-object {
              write-host ("                              $_" )
          }            
          write-host     ("[ 7] Export VM                "  )                                                         
          write-host     ("[ 8] Delete VM  "  )                                                          
          write-host     ("[ 9] Integration Components   :                  [ {0}/{1} Enabled                                       ]" -f ($vmics | where {$_.enabledState -eq [VMState]::running} | Measure-Object ).count ,
                                                                                                      ($vmics | Measure-Object ).count)
          Write-Host     ("[10] CPU                      :   {0} Processor(s) [ Reserve:{1,7}/100000 - Limit:{2,7}/100000 - Weight:{3,-4}   ]" `
                                                                                                   -f $VMcpu.VirtualQuantity, $VMcpu.Reservation, $VMcpu.Limit, $VMcpu.Weight) 
          write-host     ("[11] Memory                   :        {0, 6} MB [ Buffer :{1,7}%       - Limit:    {2,7} MB - Weight:{3,-6} ]"           -f $VMMemory.virtualQuantity,$vmMemory.TargetMemoryBuffer, $VmMemory.limit , $vmMemory.weight )
          if ($vmscsi.count -lt 4)   {
              write-host ("[12] SCSI Controllers         :                  [ {0} Present                                                     ]"     -f ([int]$vmscsi.count) )  
              write-host ("[13] IDE and SCSI Disks       : ") 
          }
          else {
              write-host ("[13] IDE and SCSI Disks       :                 [ Max 4 SCSI Controllers present                                    ]" )     
          }        
          if ($vmdisk) { $vmDisk | foreach-object {
              write-host ("     {0,-25                  }: {1,15         }: [ {2,-61} ]"             -f ($_.controllerName +" LUN:"+ $_.DriveLUN) , $_.DriveName, $_.diskimage)}
          }
          write-host     ("[14] Floppy Disk              :           Image: [ {0,-61} ]"             -f $(if ($vmFloppy.Connection) {$VMFloppy.connection[0]} else {""}))
          $Global:count=15 ;                   
          $vmComPort | foreach-object {if ($_) {
              write-host ("[{2,2}] {0,-25               }:      Connection: [ {1,-61} ]"             -f $_.ElementName, $_.connection[0],($Global:count ++))
          }}
          if ($vmRFX) {      
          Write-Host     ("[18] Remote FX                :     {0} Monitor(s) [ {1,-61} ]"           -f $vmRFX.MaximumMonitors, ([RemoteFxResoultion]$vmRFX.MaximumScreenResolution) )}
          elseif ((Get-WmiObject -ComputerName $vm.__server -class win32_operatingsystem).version -gt "6.1.7600"){
          Write-Host     ("[18] Add Remote FX controller :")}
          if ((($vmNic | where {$_.type -eq "synthetic"} | measure-object).count -lt 8) -or (($vmnic | where {$_.type -eq "emulated"} | measure-object).count -lt 4) ){
              write-host ("[19] Add Network interface    : ")
          }
          $Global:count=20
          $vmnic     | foreach-object {if ($_) {
              write-host ("[{3,2}] {0,-25               }: MAC:{1         } [ {2} ] "            -f $_.ElementName,$_.address,(Get-VMnicSwitch $_).elementname ,($Global:count ++))
          }}
          if (get-Module FailoverClusters -ErrorAction SilentlyContinue) {
          write-host   ("`n[30] Cluster status           :                  [ {0,-61} ]"           -f  $VMCG.state)
          }
          write-host   ("`n[40] Refresh data")
          write-host   ("`n[99] Exit this menu`n")
          $selection = [int](read-host    "Enter a selection")
        
          if ($?) {switch ($selection) {
              1 {  switch ($vm.enabledState ) {
                       {$_ -eq [vmstate]::Suspended} {   
                           Switch (select-item -TextChoices @("&Delete Saved state", "&Start VM", "&Cancel") -Caption "$($vm.elementname) is Suspended" -Message "Do you want to:" -default 2) {
                               0 {stop-vm  -Confirm -VM $vm ; $null = read-host "Press [enter] to continue" ; $vm.get() }
                               1 {Start-Vm          -VM $vm ; $null = read-host "Press [enter] to continue" ; $vm.get() }
                           }        
                       }    
                       {$_ -eq [vmstate]::Stopped }  {
                           if ((select-item -TextChoices @("&Start VM", "&Cancel") -Caption "$($vm.elementname) is Stopped" -Message "Do you want to:" -default 1) -eq 0) {
                                Start-VM $vm 
                                $null = read-host "Press [enter] to continue"  
                                $vm.get()
                           }
                       }
                       {$_ -eq [vmstate]::Running }  {
                            switch (select-item -TextChoices @("&Save VM","&Turn off VM", "Shut &Down the OS", "&Cancel")  -Caption "$($vm.elementname) is running" -Message "Do you want to:" -default 3) {
                                0 {Save-VM                    -VM $vm ; $null = read-host "Press [enter] to continue"  ;$vm.get()  } 
                                1 {Stop-VM           -Confirm -VM $vm ; $null = read-host "Press [enter] to continue"  ;$vm.get()  }
                                2 {Invoke-VMShutdown -Confirm -vm $vm ; $null = read-host "Press [enter] to continue"  ;$vm.get()  }
                            }     
                       }
                   } 
                } 
              2 {  $name=read-host "Enter the new name for the VM [leave blank to remain as $($vm.elementName)]"  
                   if ($name -ne "") { 
                        Set-vm -confirm -VM $vm -name $Name 
                        $vm.get()
                        $vmsd.get()
                   }        
                }
              3 { $vm.get(); if ($vm.EnabledState -eq [vmstate]::Stopped)  {
                       Write-host "Select the devices which in the order you want to boot from them. `n Any you don't select will be added in the order Floppy,CD,IDE,NET"
                       $newbootOrder = ($vmsd.BootOrder | select-object @{name="Device"; Expression={[bootMedia]$_}} | select-list -multiple -property Device  | %{$_.device} )
                       if ($newbootOrder -is [array]) {"Floppy","CD","IDE","NET" | ForEach-Object -process {if ($newbootOrder -notcontains $_) {$newbootOrder = $newBootOrder + $_}} `
                                                                                                      -end {set-vm -confirm -VM $vm -bootOrder ([bootmedia[]]$newbootOrder)}}
                       else                           {write-host "You need to enter at least 2 devices." }                                               
                       $null = read-host "Press [enter] to continue" ; $vmsd.get()
                   }
                   else {$null = read-host "You can change the boot order only when the VM is stopped.`nPress [enter] to continue"}
                }
              4 {  $Notes=read-host "Enter the new notes for the VM [leave blank to keep notes unchanged}"  
                   if ($Notes -ne "") { Set-vm -confirm -VM $vm -notes $Notes  ; $vmsd.get() }        
                }
              5 {   Write-host "Please select the action to be taken if the virtual machine worker process terminates abnormally"
                    $autoRecovery = Select-EnumType -EType RecoveryAction -default $vsgsd.AutomaticRecoveryAction
                    Write-host "Please select the action to be taken if the host OS is shutdown with the VM running"
                    $autoShutdown = Select-EnumType -EType ShutdownAction -default $vsgsd.AutomaticShutdownAction
                    Write-host "Please select the action to be when the host OS is Starts with the VM running"
                    $autoStartup  = Select-EnumType -EType StartupAction -default $vsgsd.AutomaticStartupAction  
                    if ($autostartup -ne [startupAction]::none) {$autoDelay= Read-host "Please enter the time in seconds to delay the automatic start up"   } 
                    if (-not $autoDelay) {$autoDelay = [System.Management.ManagementDateTimeconverter]::ToTimeSpan($VSGSD.AutomaticStartupActionDelay).Seconds }
                    if (     ($autoRecovery -ne $vsgsd.AutomaticRecoveryAction) -or ($autoShutdown -ne $vsgsd.AutomaticShutdownAction     ) `
                         -or ($autoStartup  -ne $vsgsd.AutomaticStartupAction ) -or ($autoDelay    -ne $vsgsd.AutomaticStartupActionDelay )) {
                        Set-vm -Confirm -vm $vm -AutoRecovery $autoRecovery -AutoShutDown $autoShutdown -autoStartup $autoStartup -AutoDelay $autoDelay
                        $null = read-host "Press [enter] to continue" 
                        $vsgsd.get() 
                    }    
                 }
               6 { if ($vmSnap -ne "-") {$action = select-item -TextChoices @("Create a &New snapshot" ,"&Apply a SnapShot","&Delete a SnapShot" , "&Rename a SnapShot" , 
                                                  "&Update a snapshot" , "&Cancel") -Caption "What do you want to do:" -default 5 
                   }
                   else                 {$action = 0 ; Write-host "No existing Snapshots, creating new Snapshot" }
                   switch ($action) {
                       0   {$note = Read-Host "Enter a note to describe the snapshot [optional]" 
                            New-VMSnapshot -VM $vm -note $note -wait -Confirm
                           }
                       {1..4 -contains $_}
                           {$snap = Select-VMSnapshot $vm} 
                       1   {Restore-VMsnapshot -SnapShot $snap -wait -Confirm ;  $refreshNeeded = $true  } 
                       2   {$Tree = [boolean](select-item -TextChoices @("&No" ,"&Yes") -Caption "Deleting Snapshot(s)" -message "Do you want to delete children of the select snapshot, if any ?" )
                            Remove-VMSnapshot  -snapshot $Snap -Tree:$tree -wait -Confirm
                           }
                       3   {$name = Read-Host "Please enter the new name for the snapshot"
                            if ($name) {rename-vmsnapshot  -snapshot $snap -newName $name}
                           }
                       4   {Update-VMSnapshot -VM $vm -snapName $snap.elementName -Confirm}
                       {0..4 -contains $_}    
                           {$null = read-host "Press [enter] to continue" ; $VmSnap = Get-VMSnapshottree $vm}
                   }                           
                 }
               7 { if (($vm.EnabledState -eq [vmstate]::Stopped) -or ($vm.EnabledState -eq [vmstate]::suspended)) {
                        $path = Read-host "Please enter path to store the exported files"
                        if ($path) { 
                            $CopyState = [boolean](select-item -TextChoices @("&Configuration data only","&Machine State and Configuration data") -Caption "What do you want to export:" -default 1 )
                            Export-VM -VM $vm -path $path -copyState:$copyState  -confirm
                            $null = read-host "Press [enter] to continue" 
                        }
                        else {$null = read-host "You can add export only when the VM is saved or stopped.`nPress [enter] to continue"}  
                   }
                 }  
               8 { if ((remove-vm -Confirm -VM $vm) -eq [ReturnCode]::OK) {return $null} } 
               9 { Write-host "Switch integration components between 'Running' (enabled) status and 'Stopped' (disabled status)"
                   $vmics | select-list -multiple -Property elementName, @{name="State";expression={[vmstate]$_.enabledstate}}  | 
                       Foreach-Object -begin   {$c=@()} `
                                      -process {$c += $_.elementName} `
                                      -end     {if ($c) {$null=Set-VMIntegrationComponent -vm $vm -Confirm -componentName $C 
                                                         $vmics = Get-VMIntegrationComponent -vm $vm
                                      }}
                 }
              10 { $vm.get() 
                   if ($vm.EnabledState -eq [vmstate]::Stopped)  {
                       $cpucount = Read-host "Enter the new number of Virtual CPUs [Leave blank to remain as $($VMcpu.VirtualQuantity)]" 
                   }
                   else {Write-host "You can change the number of processors only when the VM is stopped."}
                   if (-not $cpucount) {$cpuCount = $VMcpu.VirtualQuantity}
                   if ($vm.EnabledState -ne [vmstate]::Suspended)  {
                       $limit  = Read-host "Enter the new CPU limit (0 - 100000) [Leave blank to remain as $($VMcpu.Limit)]"
                       if (-not $limit) {$limit = $VMcpu.limit} 
                       $Reservation  = Read-host "Enter the new CPU Reservation (0 - 100000) [Leave blank to remain as $($VMcpu.Reservation)]"
                       if (-not $Reservation) {$Reservation = $VMcpu.Reservation} 
                       $Weight  = Read-host "Enter the new CPU Weight (default=100) [Leave blank to remain as $($VMcpu.weight)]"
                       if (-not $Weight) {$Weight = $VMcpu.Weight ; write-debug "Weight"} 
                           if ( ($Weight -ne $VMcpu.Weight) -or ($Reservation -ne $VMcpu.Reservation) -or ($limit -ne $VMcpu.limit) -or ($cpuCount -ne $VMcpu.VirtualQuantity)) {
                                if ($vm.EnabledState -eq [vmstate]::Stopped)  {Set-VMCPUCount -Confirm -VM $vm -CPUCount $CpuCount -Limit $limit -Reservation $reservation -Weight $weight }
                                else                                          {Set-VMCPUCount -Confirm -VM $vm                     -Limit $limit -Reservation $reservation -Weight $weight }
                           $null = read-host "Press [enter] to continue"
                           $vmCpu.get()
                       }
                   }
                   else {$null=Read-host "CPU weightings can not be changed on a saved VM``nPress [Enter] to continue"}
                 }
              11 { $vm.get()
                   $DynamicMemoryEnabled = $vmmemory.DynamicMemoryEnabled
                   $MemoryLimit = 0 
                   if ((Get-WmiObject -ComputerName $vm.__server -class win32_operatingsystem).version -gt "6.1.7600"){
                      if ($vm.EnabledState -eq [vmstate]::Stopped) {
                          if ($vmmemory.DynamicMemoryEnabled) {
                              $DynamicMemoryEnabled = [boolean](select-item -TextChoices @("&Disabled","&Enabled") -Caption "Dynamic Memory is Enabled "-Message "Should it be:" -default 1 )
                          }
                          Else {
                              $DynamicMemoryEnabled = [boolean](select-item -TextChoices @("&Disabled","&Enabled") -Caption "Dynamic Memory is Disabled "-Message "Should it be:" -default 0 )    
                          } 
                          $Memory=[int](Read-host "Please enter the new amount of memory in MB - or nothing to leave it as $($VMMemory.virtualQuantity)")
                          if ($Memory -eq 0 )     {$memory      = $VMMemory.virtualQuantity}
                          if ($DynamicMemoryEnabled) {
                                $MemoryLimit=[int](Read-host "Please enter the new  memory Limit in MB - or nothing to leave it as $($VMMemory.Limit)")
                          }
                          if ($MemoryLimit -eq 0) {$MemoryLimit = $VMMemory.Limit }
                      }
                      else {write-host "You can change the memory size only when the VM is stopped."
                            if (-not $DynamicMemoryEnabled) {$null = read-host "Press [enter] to continue"}
                      }
                      if ($DynamicMemoryEnabled) {
                                $MemoryBuffer=[int](Read-host "Please memory buffer Percentage between 5 and 2000 - or nothing to leave as $($VMMemory.TargetMemoryBuffer)")
                                if ($memoryBuffer -eq 0) {$MemoryBuffer = $VMMemory.TargetMemoryBuffer}
                                $memoryWeight=[int](Read-host "Please memory weighting between 1 and 10000 - or nothing to leave as $($VMMemory.Weight)")
                                if ($memoryWeight -eq 0) {$memoryWeight = $VMMemory.Weight}
                                if ($vm.EnabledState -eq [vmstate]::Stopped) {Set-VMMemory -Confirm -VM $vm -Dynamic -Weight $memoryWeight -BufferPercentage $memoryBuffer -Memory $memory -limit $MemoryLimit  |
                                                                                out-null ; $null = read-host "Press [enter] to continue"  ;$vmmemory.get()}
                                else                                         {Set-VMMemory -Confirm -VM $vm -Dynamic  -Weight $memoryWeight -BufferPercentage $memoryBuffer |
                                                                                out-null ; $null = read-host "Press [enter] to continue"  ;$vmmemory.get()}       
                      } 
                      elseif ((($memory -ne  $VMMemory.virtualQuantity) -or ($vmmemory.DynamicMemoryEnabled -ne $DynamicMemoryEnabled)  ) -and ($vm.EnabledState -eq [vmstate]::Stopped) )
                                                                             {Set-VMMemory -Confirm -VM $vm -Memory $memory | out-null ; $null = read-host "Press [enter] to continue"  ;$vmmemory.get() }
                  }
                  else {     
                       if ($vm.EnabledState -eq [vmstate]::Stopped) {
                            $Memory=[int](Read-host "Please enter the new amount of memory in MB - or nothing to leave it as $($VMMemory.virtualQuantity)")
                                
                            if ($memory) {Set-VMMemory -Confirm -VM $vm -Memory $memory | out-null ; $null = read-host "Press [enter] to continue"  ;$vmmemory.get() }
                        }
                        else {$null = read-host "You can change the memory size only when the VM is stopped.`nPress [enter] to continue"}
                   }     
                 } 
              12 { $vm.get()
                   if ($vm.EnabledState -eq [vmstate]::Stopped) {
                      if      (-not $vmScsi.count)  {$selection = 0}
                      elseif  ($vmScsi.count -eq 4) {$Selection = 1}
                      else   { $selection = Select-item -TextChoices "&Add a SCSI Controller","&Remove a SCSI controller","&Cancel" -Caption "SCSI Controllers" -Message "Would you like to:" }   
                      if ($Selection -eq 0) {
                           $nameSuffix = Read-host "By default all SCSI Controllers use the same display name.`nEnter a suffix to identify this SCSI controller [optional]"
                           add-vmscsicontroller -vm $vm -name ($lstr_VMBusSCSILabel + $namesuffix) -confirm | out-Null
                           $null = read-host "Press [enter] to continue"
                      }
                      if ($selection -eq 1) {$rasd =($vmscsi | select-list -Property @{Name="Controller"; expression={$_.ElementName}},
                                                                                     @{Name="Drive(s) Attached";expression={(Get-VMDriveByController $_ | measure-Object).count}}) 
                                             if ($rasd) {Remove-VMRasd -confirm -VM $vm -rasd $rasd                                         
                                                         $null = read-host "Press [enter] to continue" 
                                             }
                      }
                   }                             
                   else  {$null = read-host "You can add hardware only when the VM is stopped.`nPress [enter] to continue"}  
                   [Object[]]$vmScsi = Get-VMDiskController $vm -SCSI 
                 }
              13 { Show-VMdiskMenu -vm $vm -vmDisk $vmDisk -vmscsi $vmScsi 
                   [Object[]]$vmDisk  = Get-VMDisk $vm
                 }
              14 { if ($vmFloppy.Connection) { Remove-VMFloppyDisk -Confirm $vm}
                    Else                     { $path = Read-host "Please enter path to the VFD file."
                                                if ($path) {Add-VMFloppyDisk -VM $vm -Path $path}
                    }
                    $null = read-host "Press [enter] to continue" ; 
                    $VMFloppy   = Get-VMFloppyDisk $vm          
                 }
{($_ -eq 15)`
-or ($_ -eq 16)} { $port = ($_ - 14) 
                   $path = Read-host "Please enter the path for the named pipe to use as connection for COM$Port or blank to disconnect."
                   $null = Set-VMSerialPort -Confirm -vm $vm -PortNumber $port -Connection $path 
                   $null = read-host "Press [enter] to continue" ; $vmComPort= Get-VMSerialPort -vm $vm
                 }
              18 {  if ($vm.EnabledState -eq [vmstate]::Stopped)  {
                        if ($vmRFX) {$RFXResolution = $vmrfx.MaximumScreenResolution 
                                     $RFXMonitors   = $vmrfx.MaximumMonitors
                                     $action = select-item -TextChoices @("&Remove Remote FX controller","&Configure Remote FX controller") -Caption "What do you want to do:" -default 1}
                        else        {$RFXResolution = 0
                                     $RFXMonitors   = 1
                                     $action = 1 }
                        if ($action -eq 0) {Remove-VMRemoteFXController -Confirm -VM $vm ; $null = read-host "Press [enter] to continue"
                                          $vmRFX = $null }
                        else             {Write-host "Select the new resolution (Default $([RemoteFxResoultion]$RFXResolution) )"
                                          $RFXResolution = Select-EnumType RemoteFxResoultion -default $RFXResolution
                                          $RFXM = [int](Read-host "Please enter the new Number of monitors - or nothing to leave it as $RFXMonitors")
                                          if ($RFXM -eq 0) {$RFXM = $RFXMonitors }
                                          
                                          $vmRFX = Set-VMRemoteFXController -Confirm -VM $vm -Monitors $RFXM -Resolution $RFXResolution 
                                          $null = read-host "Press [enter] to continue"}
                    }
                    
                    else  {$null = read-host "You can configure RemoteFX only when the VM is stopped.`nPress [enter] to continue"}         
                 }   
              19 { if ($vm.EnabledState -eq [vmstate]::Stopped) {
                       if ((($vmNic | where {$_.type -eq "synthetic"} | measure-object).count -lt 8) -and (($vmnic | where {$_.type -eq "emulated"} | measure-object).count -lt 4) )
                            {$legacy = [boolean]( select-item -TextChoices @("&Synthetic / VMbus NIC","&Emulated / Legacy NIC") -caption "Which type of Network Interface Card ?" -default 0 )}
                       else {$legacy =  (($vmnic | where {$_.type -eq "emulated"} | measure-object).count -lt 4)}
                       Write-host "Please select a new switch for the NIC" 
                       $switch = Select-VMSwitch -Server $Vm.__server 
                       $nic = Add-VMNIC -VM $vm -legacy:$legacy -Virtualswitch $Switch -Confirm
                       $vmnic = Get-VMNic $vm
                   }
                   else  {$null = read-host "You can add hardware only when the VM is stopped.`nPress [enter] to continue"}         
                 }
{($_ -ge 20)`
-and $_ -lt 30}  { $nic = $vmNic[($_ -20)]
                   if ($vm.EnabledState -eq [vmstate]::Stopped) { $action = select-item -TextChoices @("&Connect to a different network", "Change &MAC", "&Delete NIC") -Caption "What do you want to do:" -default 0 }
                   else                                         { $action = 0 ; Write-host "You can delete or change the MAC address of a NIC only when the VM is stopped"}
                   switch ($action) {
                        0 { Write-host "Please select a new switch for the NIC" 
                            $switch = Select-VMSwitch -Server $nic.__server 
                            Set-VMNICSwitch -nic $nic -Virtualswitch $switch -Confirm | out-null
                          }  
                        1 { Set-VMNICAddress -Nic $nic -mac (Read-host "Please enter the new MAC address") -Confirm  }
                        2 { Remove-VMNIC -Nic $nic -confirm}   
                    }
                    $vmnic = Get-VMNic $vm
                 }
             30  { if (-not $VMCG) {if (select-item -TextChoices @("&No" ,"&Yes") -Caption "Configuring Clustering" -message "Do you want to configure this virtual machine for High Availablity ?" ) {
                                        Add-ClusterVirtualMachineRole -Name $vm.ElementName -VirtualMachine $vm.ElementName -Cluster $vm.__SERVER | out-null
                                        $VMCG = Get-vmClusterGroup $vm
                   }}
                   Else {  $RunningNodes = Get-Clusternode -cluster $vm.__SERVER | Where-Object {$_.state -eq "Up" -and $_.name -ne $VMCG.OwnerNode}
                           if ($RunningNodes -and $VMCG.state -eq "Online") {if (select-item -TextChoices @("&No" ,"&Yes") -Caption "Configuring Clustering" -message "Do you want to Live migrate virtual machine to another node ?" ) {
                                                                             $destination = (Select-list $runningNodes -property Name)
                                                                             move-vm -VM $vm -Destination $destination | out-null ; Start-Sleep -Seconds 5 ; return}}
                           if ($RunningNodes -and $VMCG.state -eq "Offline") {if (select-item -TextChoices @("&No" ,"&Yes") -Caption "Configuring Clustering" -message "Do you want move this virtual machine to another node ?" ) {
                                                                             $destination = (Select-list $runningNodes -property Name)
                                                                             Move-ClusterGroup -Cluster $vm.__SERVER -name $vmcg -node $destination | out-null ; Start-Sleep -Seconds 5 ; return} }                                                 
                           if (-not $runningNodes) {Read-host "There are no nodes available to take this VM.`nPress [Enter] to Continue"} 
                           }
                                                          
                 } 
             40  {$vm.get()
                  $refreshneeded = $true
                  if ($VMCG) {Sync-vmClusterConfig -vm $vm -force | out-null}
                 }
          }} 
    } while ($selection -le 50) }           
}