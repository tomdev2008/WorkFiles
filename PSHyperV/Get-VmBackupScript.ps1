Function Get-VmBackupScript
{param($vm="%", $BackupDevice="e:\" , $SERVER=".", [switch]$dataFiles ) 
 Write-Warning "This method of backup is not supported by Microsoft product support services "
 
 # We have to make shadow copies of all volumes touched by hyper-v, and the system drive. 
 # So get a list disk volumes, for all VMs, 
 # Add their parent disks
 # Add the VMs Snapshot and Data folders 
 # Add the OS System Directory 
 # then check which volumes are in the list above. 
 
 $diskPaths  = Get-VMDisk -vm % -Server $Server -snapshot | foreach {$_.diskpath} | select-object -unique          
 $diskpaths += $Diskpaths | where {$_.toupper().endswith("VHD")} | Get-VHDInfo | forEach {$_.parentPath} | select-object -unique
 $diskpaths += Get-WmiObject -NameSpace "root\virtualization" -class "Msvm_VirtualSystemGlobalSettingData" | foreach-object {$_.SnapshotDataRoot ; $_.ExternalDataRoot } | select-object -unique 
 $diskpaths += (get-wmiobject -computerName $server -class win32_operatingSystem).systemdirectory
 $vols=&{foreach ($volume in (get-wmiobject -computerName $server -class Win32_volume)) {
                 if ( ($null -ne ($diskpaths | where {$_ -match $volume.name.replace("\","\\")})     ) -or
                      ($null -ne ($diskpaths | where {$_ -match $volume.DeviceID.replace("\","\\")}) )     ) {$volume} }
         }
   "Rem this method of backup may work, but is not supported by Microsoft."
   "Rem CMD file for Backing up vhds on Server $server - Stage 1 build the script for diskshadow"
   "echo Delete Shadows all                                    > Script.dsh "
   "echo Set Context Persistent                               >> Script.dsh "
   "echo Begin Backup                                         >> Script.dsh "
   "echo Writer Verify {66841cd4-6ded-4f4b-8f17-fd23f8ddc3de} >> Script.dsh "
   
   #The script is going to have one line for each volume          e.g. "Add Volumne C:\ Alias MyShadow1 
   #And then later it will expose the shadow copy using the alias e.g. "Expose %MyShadow1%" 
   #And then it runs a script which                               e.g. "Exec copyVM1.cmd"
   #If the VM(s) being backed up don't use that volume then CopyVMn.cmd won't do much !
   
   $Vols | foreach -begin {$i=0} -process {$i++ ; 
   "echo Add Volume $($_.name) ALIAS MyShadow$i                       >> Script.dsh "}
   "echo Create                                               >> Script.dsh "
   "echo End Backup                                           >> Script.dsh "
   $Vols | foreach -begin {$i=0} -process {$i++ ; 
   "echo Expose %MyShadow$i% X:                                >> Script.dsh "
   "echo Exec CopyVM$i.CMD                                     >> Script.dsh "}
   "echo Unexpose X:                                          >> Script.dsh "
   "echo Exit                                                 >> Script.dsh "   
   "  "
 
 # Now get the disk paths and data paths for the VM(s) being backed up 
 $diskPaths =  Get-VMDisk -vm $vm -Server $Server -snapshot | foreach {$_.diskpath} | select-object -unique          
 $diskpaths += $Diskpaths | where {$_.toupper().endswith("VHD")} | Get-VHDInfo | forEach {$_.parentPath} | select-object -unique
 If ($Datafiles) {$Datapaths = (Get-WmiObject -NameSpace "root\virtualization" -Query "Select * from  Msvm_VirtualSystemGlobalSettingData where Elementname like '$VM'" | 
                                foreach-object {$_.SnapshotDataRoot ; $_.ExternalDataRoot } )| sort |  select-object -unique }                              
 else {$Datapaths = @()}      
 
 $Vols | foreach -begin {$i=0} -process {$i++ ; 
 $vn          = $_.name
 $vid         = $_.DeviceID
 $vnRegEx     = $_.name.replace("\","\\").replace("?","\?")
 $vidRegEx    = $_.DeviceID.replace("\","\\").replace("?","\?")
 $destination = $Backupdevice + ($_.__Server) + $_.DeviceID.SPLIT("?")[1] 
   
   "Rem Build the CMD file to be run by disk shadow for $vn, as copyvm$i.cmd"
   "echo MD ""$destination"" > CopyVM$i.CMD" 
   $Datapaths | where {$_ -match "^$vnRegEx"}  | foreach {$CopyFrom=$_.replace($vn,'X:\')
                              $CopyTo  =$_.replace($vn,$destination)
                              "echo MD """+ $CopyTo.Substring(0,$copyto.lastIndexof("\")) + """   >> copyVM$i.CMD"
                              "echo RoboCOPY ""$CopyFrom""  ""$Copyto"" /E >> CopyVM$i.Cmd " }
   $Datapaths | where {$_ -match "^$vidRegEx"} | foreach {$CopyFrom=$_.replace($vn,'X:\')
                              $CopyTo  =$_.replace($vn,$destination)
                              "echo MD """+ $CopyTo.Substring(0,$copyto.lastIndexof("\")) + """   >> copyVM$i.CMD"
                              "echo RoboCOPY ""$CopyFrom""  ""$Copyto"" /E >> CopyVM$i.Cmd " }
   
   $diskpaths | where {$_ -match "^$vnRegEx"}  | foreach {$CopyFrom=$_.replace($vn,'X:\')
                              $CopyTo  =$_.replace($vn,$destination)
                              "echo MD """+ $CopyTo.Substring(0,$copyto.lastIndexof("\")) + """   >> copyVM$i.CMD"
                              "echo COPY ""$CopyFrom""  ""$Copyto""  >> CopyVM$i.Cmd " }
   $diskpaths | where {$_ -match "^$vidRegEx"} | foreach {$CopyFrom=$_.replace($vid,'X:\')
                              $CopyTo  =$_.replace($vid,$destination)
                              "echo MD """+ $CopyTo.Substring(0,$copyto.lastIndexof("\")) + """   >> copyVM$i.CMD"
                              "echo COPY ""$CopyFrom""  ""$Copyto""  >> CopyVM$i.Cmd " }
   }
   ""
   "Rem Now Invoke disk shadow, and get out of here "
   "DiskShadow /s Script.dsh "   
   " "   
   "Exit"
}
#Example 1: Get-VmBackupScript -Server Hyper-Core -BackupDevice R: |  winrs -r:hyperCore cmd.exe
#           Gets a backup script to copy the VHDs and ISOs for all vms on the server "hyper-core" to its drive R:, and runs it by piping it into a WINRS session. 
#Example 2: Get-VmBackupScript -datafiles |  CMD
#           Gets a backup script to copy the VHDs, ISOs and Datafiles for all vms on the local server and runs it by piping it into CMD.exe 


######################################################################################################
#                                                                                                    #
# Functions for working with Networking, (NICS, switches and ports on switches that nics connect to) #
#                                                                                                    #
######################################################################################################

