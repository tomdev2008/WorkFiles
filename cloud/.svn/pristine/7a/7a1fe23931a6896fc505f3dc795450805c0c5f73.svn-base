

Function Show-HypervMenu
{<#
    .SYNOPSIS
        Displays a menu to manage hyperv    
    .PARAMETER Server
        The Server to manage (by default, the local Computer)
#>

 Param ( $server="." )
    $hiBack= $host.UI.RawUI.ForegroundColor
    $hiFore= $host.UI.RawUI.BackgroundColor
    if ($hiFore -eq -1) {$hiFore = ($HiBack -bxor 15)}    
    $Host.UI.RawUI.WindowTitle = "Hyper-V Management" 
        Do {
      Clear-host
           $VSMSSD           = Get-WmiObject -ComputerName $Server -NameSpace $HyperVNamespace -Class "MsVM_VirtualSystemManagementServiceSettingData"
           [object[]]$VM     = Get-vm -server $Server | sort ElementName 
           [object[]]$switch = get-vmSwitch -server $server
           $FreeNic      = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -query "Select * from Msvm_ExternalEthernetPort where isbound=false"  
           
           if ($host.name -notmatch "\sISE\s")  {
              $heading = "Configuring $($VSMSSD.__server)"
              $heading=(("-" * ($host.ui.RawUI.WindowSize.width-1)) + "`n" + ("|"+$heading.Padleft(($heading.length / 2) + ($host.ui.RawUI.WindowSize.width /2))).padright($host.ui.RawUI.WindowSize.width -2) +"|") + "`n" + (("-" * ($host.ui.RawUI.WindowSize.width-1))) + "`n"
                write-host -ForegroundColor $hifore -BackgroundColor $hiBack $heading 
           }                             
           Else {Write-host ("-------------------------------------------------------------------------------"+
                           "`n                       Configuring $($VSMSSD.__server)"  +
                           "`n-------------------------------------------------------------------------------")
           }
           Write-host     ("[ 1] Select a different Server" +
                         "`n[ 2] Manage Server settings" +
                        ("`n                     MAC address  range [ {0,24} - {0,-23} ]" -f $VSMSSD.MinimumMacAddress,$VSMSSD.MaximumMacAddress) +
                        ("`n                     Default  VM folder [ {0,-50} ]  " -f $VSMSSD.DefaultExternalDataRoot)    +              
                        ("`n                     Default VHD folder [ {0,-50} ]  " -f $VSMSSD.DefaultVirtualHardDiskPath) +
                         "`n[ 3] Manage Network settings ")
           $switch  | Foreach-object{
               write-host ("                        Virtual Network [ {0,-50} ]" -f $_.elementname)
           }
           if (get-Module FailoverClusters -ErrorAction SilentlyContinue) {
           write-host      "[ 4] Cluster Networks for Live Migration "
           get-VMLiveMigrationNetwork | ForEach-Object{
           write-host (                                "     {0,-35}[ {1,-50} ]" -f $_.name,$_.address)}}
           Write-host (  "`n[ 5] Manage Virtual Disk files" )
           if (get-Module FailoverClusters -ErrorAction SilentlyContinue) {
           if ((Get-Cluster $server).enableSharedvolumes -ne "enabled") {write-host "     Cluster shared Volumes are disabled"} else {
           write-host "     Cluster Shared Volumes"
           foreach ($vol in (Get-ClusterSharedVolume)) {foreach ($sharedVol in $vol.sharedvolumeinfo) { 
               write-host ("     {1,-35}[ {0,-34} {2,15}]" -f $vol.name,$sharedvol.FriendlyVolumeName, ($sharedVol.partition.freespace / 1gb).tostring("#,###.## GB Free")) }}  
           }}
           
           Write-host (  "`n[ 6] Create Virtual Machine" + 
                         "`n[ 7] Import Virtual Machine" )
           if (get-Module FailoverClusters -ErrorAction SilentlyContinue) {
           Write-host      "[ 8] Live migrate Virtual Machines" }
           write-host    "`n     Manage Virtual Machines ..."
           $global:count=10 ;  $vm | select-object -first 10 |  ForEach-Object {
               write-host ("[{0,2}] {1,-34} [ {2,-10} ]" -f ($Global:count ++) , $_.elementName, [vmState]$_.enabledState )  }
           if ($vm.Count -gt 10) {
              Write-host "`n[20] More Virtual Machines ..." 
           } 
           Write-host    "`n[99] Exit this menu"
           $selection= [int](read-host -Prompt "`nPlease enter a selection") 
           switch ($selection) {
                1  {    $newServer = Read-Host "Enter the name of the server you want to connect to"
                        if ($newServer) {
                            $temp = Get-WmiObject -ComputerName $NewServer -NameSpace $HyperVNamespace -Class "MsVM_VirtualSystemManagementServiceSettingData"
                            if ($?) {$Server=$newServer}  else {$null = Read-host "Can not Contact that server. Press [Enter] to continue"}
                        }
                   }
                2  {    $ExtdataPath = Read-host "Please enter the path to the new VM data folder, or press [enter] to leave unchanged"
                        if (-not $ExtdataPath) {$ExtdataPath = $VSMSSD.DefaultExternalDataRoot }
                        $VHDPath = Read-host "Please enter the path to the new VHD folder, or press [enter] to leave unchanged"
                        if (-not $VHDPath) {$VHDPath = $VSMSSD.DefaultVirtualHardDiskPath }
                        $minMac = Read-host "Please enter the lowest MAC address to assign, as 12 hex digits, or press [enter] to leave unchanged"
                        if (-not $minMac) {$minMac = $VSMSSD.MinimumMacAddress }
                        $maxMac = Read-host "Please enter the highest MAC address to assign, as 12 hex digits, or press [enter] to leave unchanged"
                        if (-not $maxMac) {$maxMac = $VSMSSD.MaximumMacAddress }
                        if (($ExtdataPath -ne $VSMSSD.DefaultExternalDataRoot) -or ($VHDPath -ne $VSMSSD.DefaultVirtualHardDiskPath) -or
                            ($minMac -ne $VSMSSD.MinimumMacAddress) -or ($maxMac -ne $VSMSSD.MaximumMacAddress )) { 
                               set-vmhost -Confirm -Server $server -ExtDataPath $ExtdataPath -vhdPath $VHDPath -MINMac $minMac -MaxMac $maxMac | Out-Null
                        }
                        read-host "Press enter to continue"
                        $VSMSSD.get()
                   } 
                3  {   if ($switch  ) { 
                           $Switchinfo =  foreach ($s in (get-vmSwitch -server $server)) {
                               $Swinfo = new-object psobject -Property @{"SwitchName"=$s.ElementName}
                               $ac = Get-WmiObject -Namespace $HyperVNamespace -Query "associators of {$s} where resultClass=Msvm_SwitchPort" | 
                                   Foreach-object {Get-WmiObject -Namespace $HyperVNamespace -Query "associators of {$_} where AssocClass=Msvm_ActiveConnection"} 
                               if ($ac) { add-member -InputObject $swinfo -MemberType NoteProperty -Name "ExternalNetworkName" -Value ($ac | 
                                              Foreach-Object {Get-WmiObject -Namespace $HyperVNamespace -Query "associators of {$_} where resultClass=Msvm_ExternalEthernetPort"}  ).elementName
                                          add-member -InputObject $swinfo -MemberType NoteProperty -Name "InternalNetworkName" -Value ($ac | 
                                              Foreach-Object {Get-WmiObject -Namespace $HyperVNamespace -Query "associators of {$_} where resultClass=Msvm_InternalEthernetPort"} ).elementName
                                }
                                if     (($swInfo.InternalNetworkName) -and   ($swInfo.ExternalNetworkName))   {add-member -InputObject $swinfo -MemberType NoteProperty -Name "NetworkType" -Value "External"}
                                elseif (                                     ($swInfo.ExternalNetworkName))   {add-member -InputObject $swinfo -MemberType NoteProperty -Name "NetworkType" -Value "External - no parent access"}
                                elseif (($swInfo.InternalNetworkName)                                     )   {add-member -InputObject $swinfo -MemberType NoteProperty -Name "NetworkType" -Value "Internal"}
                                else                                                                          {add-member -InputObject $swinfo -MemberType NoteProperty -Name "NetworkType" -Value "Private"}
                                $swinfo
                            }    
                            Format-Table -AutoSize -InputObject $switchInfo -property SwitchName, NetworkType,ExternalNetworkName | out-host
                            $SwitchChoice = Select-Item -TextChoice "&Cancel", "&Add a new Virtual Network","&Remove a Virtual Network" -default 0 -Caption "Virtual Network configuration" 
                       }
                       else {$switchChoice = 1}
                       if ($switchChoice -eq 1) {
                           if ($freeNic) {$SwitchType = Select-Item -TextChoice "&Cancel", "&Private", "&Internal" , "&External" -default 0 -Caption "Virtual Network Creatation" -Message "Which kind of Virtual network would you like to create"}
                           else          {$SwitchType = Select-Item -TextChoice "&Cancel", "&Private", "&Internal"               -default 0 -Caption "Virtual Network Creatation" -Message "Which kind of Virtual network would you like to create"}
                           if ($switchType)             {$switchName   = Read-host "Please enter a name for the new Virtual Network"}
                           if (($switchType -eq 3) -and ($switchName)) {$nic = Select-List -InputObject $freenic -Property name
                                                                        New-VMExternalSwitch -virtualSwitchName $switchName -server $server -ExternalEthernet $nic}
                           if (($switchType -eq 2) -and ($switchName)) {New-VMInternalSwitch -virtualSwitchName $switchName -server $server }
                           if (($switchType -eq 1) -and ($switchName)) {New-VMPrivateSwitch  -virtualSwitchName $switchName -server $server }
                       }                              
                       if ($switchChoice -eq 2) {
                           $switchOff = ($Switchinfo | Select-List -Property SwitchName).switchName
                           If ($switchOff) {Remove-VMSwitch -virtualSwitch $switchoff -server $server -confirm}
                       }                                           
                   }
                4  {   Select-VMLiveMigrationNetwork -confirm }
                5  {   show-vhdMenu $server}
                6  {   $VMName = Read-host "Please enter the Display name for the new VM. To cancel, press [Enter] with no name."
                       if ($VMName) {$Path = Read-host "Enter the folder to hold the VMs configuration, or press [Enter] to use $($VSMSSD.DefaultExternalDataRoot) "
                                     if ($path) {$VM = New-VM -Name $vmname -Server $server -path $path -Confirm } else {$VM = New-VM -Name $vmname -Server $server -path $path -Confirm }
                                      
                                     if ($VM) {Show-VMMenu $vm}}
                   }
                7  {   $Path = Read-host "Please enter the Path to the folder holding the exported files you want to import."
                       if ($Path) {$ReUse=[boolean](Select-Item -Caption "Importing VM" -Message "Do you wish to re-use IDs" -TextChoices "No", "Yes")
                                   Import-VM -path $path -Server $server -Wait -ReuseIDs:$Reuse -Confirm | Out-Null
                       }   
                   }
                8  {   $HA_VMs =  Get-cluster -name $server |  Get-ClusterGroup |
                             where-object { (Get-ClusterResource -input $_ | where {$_.resourcetype -like "Virtual Machine*"})}
                       $HA_VMs |  format-table -autosize -property Name,State,OwnerNode
                       $RunningNodes = Get-Clusternode -cluster $server | where {$_.state -eq "Up"}
                       if ($RunningNodes.count -lt 2) {write-warning "Migration needs two cluster nodes to be running"} else {
                          $HA_VMs =  $HA_VMS | where-object { $_.state -eq "Online"}
                          If (-not $HA_VMs) {Write-warning "No High Availabilty VMs are on-line on the cluster"}
                          else { 
                                 $sources =  $HA_VMs | group ownernode
                                 if ($sources -is [array]) {  Write-host "FROM which node do you want to migrate" }
	                         $SourceNode =  ($sources | Select-List -property name,@{Name="Running VMs"; expression={$_.count}})
                                 if ($sourceNode) {
                                     Write-host "Moving From: $($sourceNode.Name)"
 	                             if ($RunningNodes.count -gt 2) {  Write-host "TO which node do you want to migrate" }
                                     $destinationNode = ($RunningNodes | where {$_.name -ne $sourceNode.name} | Select-List -Property name).name 
                                     if ($destinationNode) {
                                         write-host "Moving To:   $destinationNode "
                                         $HA_VMs = ($HA_VMs | where {$_.ownerNode.name -eq $sourcenode.name} )
                                         if (($HA_vms.count -gt 1) -and (select-item -Caption "Do you want to migrate" -TextChoices "&All VMs","&Selected VMs"  -Message "")) {
                                             $HA_VMs | select-list -Property name -multi |Move-ClusterVirtualMachineRole -Node $destinationNode | out-Default} 
                                         else {$HA_VMs | Move-ClusterVirtualMachineRole -Node $destinationNode | out-default }
                                         Get-cluster -name $server | Get-ClusterGroup | 
                                               where-object { (Get-ClusterResource -input $_ | where {$_.resourcetype -like "Virtual Machine*"})} |  format-table -autosize -property Name,State,OwnerNode
                                     }
                                 } 
                          }
                       }
                       Read-host "Press [Enter] to continue." 
                   }

                                                    
                {($_ -ge 10) -and ($_ -le 19)} 
                   {   Show-VMMenu -VM $vm[($_ -10)] }
                20 {   Select-vm -Server $server | Show-VMMenu }
           }   
    } until ($Selection -gt 30) 
}  
