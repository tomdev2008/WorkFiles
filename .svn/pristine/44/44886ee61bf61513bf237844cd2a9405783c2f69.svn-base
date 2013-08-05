

Function Show-VHDMenu 
{<#
    .SYNOPSIS
        Displays a menu to manage hyperv Virtual hard disks    
    .PARAMETER Server
        The Server holding the VHDs (by default, the local Computer)
#> 
    param ($server=".") 
    
    $hiBack= $host.UI.RawUI.ForegroundColor
    $hiFore= $host.UI.RawUI.BackgroundColor
    if ($hiFore -eq -1) {$hiFore = ($HiBack -bxor 15)}    
    $folder = Get-VhdDefaultPath -server $server
    Do {
           Clear-host          
           $vhd = Get-vhd -Path $folder -server $server    
           if ($host.name -notmatch "\sISE\s")  {
                $heading = "Configuring Virtual Disks on $($VSMSSD.__server)"
                $heading=(("-" * ($host.ui.RawUI.WindowSize.width-1)) + "`n" + ("|"+$heading.Padleft(($heading.length / 2) + ($host.ui.RawUI.WindowSize.width /2))).padright($host.ui.RawUI.WindowSize.width -2) +"|") + "`n" + (("-" * ($host.ui.RawUI.WindowSize.width-1))) + "`n"
                write-host -ForegroundColor $hifore -BackgroundColor $hiBack $heading 
           }                             
           Else {Write-host ("-------------------------------------------------------------------------------"+
                           "`n                  Configuring disks on server $server"  +
                           "`n-------------------------------------------------------------------------------")
           }
           if (get-Module FailoverClusters -ErrorAction SilentlyContinue) {
           if ((Get-Cluster $server).enableSharedvolumes -ne "enabled") {write-host "     Cluster shared Volumes are disabled"} else {
           write-host "Cluster Shared Volumes"
           foreach ($vol in (Get-ClusterSharedVolume)) {foreach ($sharedVol in $vol.sharedvolumeinfo) { 
               write-host ("{1,-35} :{0,-34} {2,15}" -f $vol.name,$sharedvol.FriendlyVolumeName, ($sharedVol.partition.freespace / 1gb).tostring("#,###.## GB Free"))}}
           }}

           Write-host   ("`n[ 1] Change current folder (from $Folder )"      +
                         "`n[ 2] List current Virtual Floppy disk (VFD) files" +
                         "`n[ 3] Create a new Virtual Floppy disk (VFD) file" +
                         "`n[ 4] Create a new Virtual  Hard  disk (VHD) file" +
                       "`n`n     Inspect / Edit VHD files in $folder")
           
                         
           $global:count=10 ;  $vhd | select-object -first 10 |  ForEach-Object {
               write-host ("[{0,2}] {1} " -f ($Global:count ++) , ($_.Name -replace ($folder+"\").replace("\","\\"),""))  }
           if ($vhd.Count -gt 10) {
               Write-host ("     $folder contains too many VHD files to show `n" +
                           "[20] Select a VHD file from a full list `n" )
               Write-host  "[21] Enter the path to VHD file"
           } 
           Write-host    "`n[99] Exit this menu"
           $selection= [int](read-host -Prompt "`nPlease enter a selection") 
           switch ($selection) {
                1  {    $newFolder = Read-Host "Please enter the name of the folder you want to connect to "
                        if ($newFolder) {
                           $newFolder = $newFolder -replace '\\$',''
                            $d = get-wmiobject -ComputerName $server -query ("select * from Win32_Directory where name='{0}'" -f $NewFolder.replace('\','\\') )
                            if ($d) { $vhd = Get-WmiObject -Query "associators of {$d} where resultClass=cim_datafile"  | where-object {$_.extension -eq "VHD"} |sort-object -Property name 
                                      $folder = $NewFolder }
                            else    { $null = Read-host "The specified directory can not be found`nPress [Enter] to continue" }
                        }
                   }
                2  {     $d = get-wmiobject -ComputerName $server -query ("select * from Win32_Directory where name='{0}'" -f $Folder.replace('\','\\') )
                         if ($d) { $v = Get-WmiObject -Query "associators of {$d} where resultClass=cim_datafile"  | sort-object -Property name  | foreach-object {
                             if  ($_.extension -eq "VFD") {write-host ($_.Name -replace ($folder+"\").replace("\","\\"),"")}
                         }}
                         $null = Read-host "Press [Enter] to continue"
                   }      
                3  {    $vfdPath   = Read-Host "Please enter the name for the VFD file" 
                        if ($vfdpath )   {
                            if ($VfDPath -notmatch "\w+\\\w+")  {$vfdPath = ($folder + '\' +  $vfdPath) }
                         }
                         if ($vfdpath )   {   
                            if ($vfdPath -notmatch ".VFD$") {$vfdPath += ".VFD"}
                            New-VFD -vfdPath $VfdPath -server $server -wait | out-null
                            $null = Read-host "Press [Enter] to continue"
                        }     
                   }
                4  {    $vhdType= Select-Item -TextChoices "&Cancel","Dynamically &Expanding", "&Fixed Size", "&Differencing" -Caption "Which type of VHD would you like to create ?" 
                        If ($VhdType) {
                            $VHDPath       = Read-Host "Please enter the name for the VHD file" 
                            if ($VHDPath -notmatch "\w+\\\w+") {$VHDPath = ($folder + '\' +  $VHDPath)  }
                            if ($vhdPath)  {
                                if ($vhdPath -notmatch ".VHD$") {$vhdPath += ".VHD"}
                                switch ($vhdType) {
                                     {@(1,2) -contains $_}  
                                        { $Fixed = ($_ -eq 2) 
                                          $size = [single](Read-host "Please enter the size of the new VHD in GB") * 1GB
                                          if ($size) { New-VHD  -server $server -VHDPath $VHDPath -Fixed:$fixed -Size $size -wait | out-null 
                                          } 
                                        }
                                     3  { $ParentPath = Read-Host "Please enter the name for the Parent VHD file" 
                                          if ($ParentPath)  {
                                              if ($ParentPath -notmatch ".VHD$")    {$ParentPath += ".VHD"}
                                              if ($ParentPath -notmatch "\w+\\\w+") {$ParentPath = ($folder + '\' +  $ParentPath) }
                                               if (Get-WmiObject -query ("Select * from cim_datafile where name='{0}' " -f $parentPath.replace("\","\\") )) {
                                                    New-VHD  -VHDPath $VHDPath -parentVHD $parentPath -server $server -wait | out-null
                                               }
                                               else {$null = Read-host "The specified parent VHD file can not be found.`nPress [Enter] to continue" }
                                           }
                                        } #2
                                }  #switch                            
                            } #vhdpath
                        }#vhd typ
                   }  #4
             {10..19 -contains $_}
                   {  $SelectedVHD = ($vhd[$_ -10]).name }
              20   {  $SelectedVHD = (Select-List -InputObject $vhd -Property ,@{Name="Name"; expression={$_.Name -replace ($folder+"\").replace("\","\\"),""}}).name     }
              21   {  
                      $SelectedVHD = Read-Host "Please enter the name of the VHD file" 
                      if ($SelectedVHD)  {
                          if ($SelectedVHD -notmatch ".VHD$")    {$SelectedVHD += ".VHD"}
                          if ($SelectedVHD -notmatch "\w+\\\w+") {$SelectedVHD = ($folder + '\' +  $SelectedVHD) }
                           if (-not (Get-WmiObject -query ("Select * from cim_datafile where name='{0}' " -f $SelectedVHD.replace("\","\\") ))) {
                               $SelectedVHD = $null
                               $null = Read-host "The specified VHD file can not be found.`nPress [Enter] to continue"
                           }
                       }              
                   } 
            {(10..21 -contains $_) -and $SelectedVHD} 
                   {  $VHDTestResult = Test-vhd -Server $server -VHDPath $SelectedVHD
                      $VHDInfo       = Get-VHDInfo -server $server -VHDPath $SelectedVHD  
                      $VHDInfo | out-host
                      if     ([vhdtype]$vhdinfo.type -eq [vhdtype]::dynamic)  {
                            $VHDSelect = select-item -TextChoices "&Return to previous menu", "Convert VHD &Type", "&ExpandVHD", "&Compact VHD" -Caption "VHD maintenance" -Message "Would you like to: "  
                      }
                      elseif ([vhdtype]$vhdinfo.type -eq [vhdtype]::fixed)  {
                            $VHDSelect = select-item -TextChoices "&Return to previous menu",  "Convert VHD &Type", "&ExpandVHD"  -Caption "VHD maintenance" -Message "Would you like to: "
                      }
                      elseif ([vhdtype]$vhdinfo.type -eq [vhdtype]::differencing -and $vhdTestResult)  {
                             $VHDSelect = select-item -TextChoices "&Return to previous menu",  "Convert VHD &Type"  -Caption "VHD maintenance" -Message "Would you like to: "
                      }
                      elseif ($vhdinfo.type -eq [vhdtype]::differencing )  {
                             $VHDSelect = 4 * (select-item -TextChoices "&No",  "&Yes" -default 1 -Caption "VHD maintenance" -Message "Would you like to reconnect the parent disk ?"  )
                      }
                      switch ($vhdSelect) {
                            1 { $vhdType = $null
                                if ([vhdtype]$vhdinfo.type -eq "differencing")  { $vhdType= if (Select-Item -TextChoices "Dynamically &Expanding", "&Fixed Size" -Caption "Which type of VHD would you like to Convert to ?") {[vhdtype]::fixed} else {[vhdtype]::Dynamic}  }
                                if ([vhdtype]$vhdinfo.type -eq "dynamic"     )  { $vhdType= [vhdtype]::fixed   }
                                if ([vhdtype]$vhdinfo.type -eq "fixed"       )  { $vhdType= [vhdtype]::dynamic }   
                                If ($VhdType) {
                                    $DestPath       = Read-Host "Please enter the name for the VHD file" 
                                    if ($DestPath)  {
                                        if ($DestPath -notmatch "\w+\\\w+") {$DestPath = ($folder + '\' +  $DestPath) }
                                        if ($DestPath -notmatch ".VHD$")    {$DestPath += ".VHD"}
                                        Convert-VHD -Server $server -VHDPath $selectedVHD -DestPath $DestPath -Type $vhdType  
                                   }
                                }
                              }
                            2 { $size = [single](Read-host "Please enter the size of the new VHD in GB") * 1GB
                                if ($size -gt $VHDinfo.MaxInternalSize) { Expand-VHD  -Server $server -VHDPath $selectedVHD -size $size -Wait | out-null    }
                                else                                    { Write-host "Current size is $($VHDinfo.MaxInternalSize /1GB)GB. You must enter a larger size."}
                              }
                            3 { compact-VHD -Server $server -VHDPath $selectedVHD  }                              
                            4 { $ParentPath = Read-Host "Please enter the name for the Parent VHD file" 
                                if ($ParentPath)  {
                                    if ($ParentPath -notmatch ".VHD$")     {$ParentPath += ".VHD"}
                                    if ($ParentPath -notmatch "\w+\\\w+")  {$ParentPath = ($folder + '\' +  $ParentPath) }
                                    if (Get-WmiObject -query ("Select * from cim_datafile where name='{0}' " -f $parentPath.replace("\","\\") )) {
                                         Connect-VHDParent -Server $server -VHDPath $selectedVHD -ParentPath $parentPath -Wait 
                                         
                                    }
                                }    
                                else {Write-host "The specified parent VHD file can not be found." }
                              }  
                            
                      }        
                      if ($vhdSelect) {$null = Read-host "Press [Enter] to continue" }
                   }                    
            }  #switch
    }   until ($Selection -gt 30) 
}
