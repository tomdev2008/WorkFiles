$LStr_WMIJobFailed2                  = "The WMI Job failed with status {0} `n {1} "
$lstr_diskMountedOffline             = "Disk mounted, but left offline, with the following ID:"
$lstr_DiskMountedNoID                = "The disk mount operation completed, but no ID was found for the disk."
$lstr_vhdMountSuccess                = "The mount operation for {0} succeed,"
$Lstr_diskMountFailed                = "The mount operation for {0} returned a failure response of: "
$lstr_VHDMounting                    = "Mount VHD "


Function Mount-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName  = $true)][ValidateNotNullOrEmpty()][Alias("path","FullName")]
        [string]$VHDPaths,
        
        $Partition,
        
        [Alias("Letter")]
        $DriveLetter, 
        
        [parameter(ValueFromPipelineByPropertyName =$true)][Alias("__Server")][ValidateNotNullOrEmpty()] 
        [string]$Server = ".",   #Only work with images on one server  
               
        [Switch]$NoDriveLetter,
        
        [Switch]$Offline
    )
    process {
        write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    = Join-Path $(Get-VhdDefaultPath $Server) $VHDPath }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if ($VHDPath)                          {
                $ImageManagementService = Get-WmiObject -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                if ((Test-wmiResult -result ($ImageManagementService.Mount($VHDPath)) -wait -JobWaitText ($lstr_VHDMounting + $vhdPath)`
                                -SuccessText ($lstr_vhdMountSuccess -f $vhdPath) -failText ($lstr_vhdMountFailure -f $vhdPath) ) `
                     -eq [returnCode]::ok)  {
                        Start-sleep -Seconds 2                
                        $MountedDiskImage = Get-WmiObject -Namespace $HyperVNamespace -query "SELECT * FROM MSVM_MountedStorageImage WHERE Name ='$($VHDPath.Replace("\", "\\"))'"
                        $Disk             = Get-WmiObject -Query ("SELECT * FROM Win32_DiskDrive " +  
                                                                 " WHERE Model='Msft Virtual Disk SCSI Disk Device' AND ScsiTargetID=$($MountedDiskImage.TargetId) " + 
                                                                 " AND   ScsiLogicalUnit=$($MountedDiskImage.Lun)   AND ScsiPort=$($MountedDiskImage.PortNumber)   " )
                        if ($Disk.Index  -is [uint32]) {
                            if ($offline) {   # Ensure the disk is offline. 
                                @("SELECT DISK $($Disk.Index)", "OFFLINE DISK", "EXIT") | DISKPART | Out-Null
                                Write-verbose $lstr_diskMountedOffline 
                                $disk | select-object -property model,size,index,partitions
                            } 
                            else { #First bring the disk on-line, then sort out drive letters
                                @("SELECT DISK $($Disk.Index)", "ONLINE DISK", "ATTRIBUTES DISK CLEAR READONLY", "EXIT") | DISKPART | Out-Null 
                                # BUGBUG:  Let's watch for disk arrival events instead of just sleeping.
                                Start-Sleep -Seconds 5     
                                
                                # only worry about Drive letters if a partition was identified
                                if ($partition) {
                                    if ($NoDriveLetter)   {  # Make sure that no drive letter is currently assigned.
                                                            @("SELECT DISK $($Disk.Index)", "SELECT PARTITION $Partition", "REMOVE", "EXIT") | DISKPART | Out-Null 
                                    }
                                    else {   # A drive letter is wanted, but was a specific letter specified ? 
                                          if ($DriveLetter) { @("SELECT DISK $($Disk.Index)", "SELECT PARTITION $Partition", "ASSIGN LETTER=$DriveLetter", "EXIT") | DISKPART | Out-Null }
                                          else              { # A drive letter is wanted but not specified. If none was specified and one is already assigned to the VHD use that.
                                                              if (-not (get-vhdmountPoint $vhdPath | ForEach-Object{$_.DeviceID}) ) {
                                                                  # If we still don't have a drive 
                                                                  $DriveLetter = Get-FirstAvailableDriveLetter
                                                                  @("SELECT DISK $($Disk.Index)", "SELECT PARTITION $Partition", "ASSIGN LETTER=$DriveLetter", "EXIT") | DISKPART | Out-Null  
                                                              }
                                          }
                                    } 
                                }   # end of sorting Drive letters for the requested partition
                                    # This may not be required with 2K8 R2 / PowerShell V2 
                                Get-VhdMountPoint -VHDPath $vhdPath | foreach-object  {if ( $(Wait-ForDisk -MountPoint $_.DeviceID)) {
                                    New-PSDrive -Name $_.DeviceID.substring(0,1) -PSProvider FileSystem -Root "$($_.DeviceID)\" -Scope Global -ErrorAction SilentlyContinue
                                }}
                            }     # end of on-lining process
                        }         # end of Successful mount
                        else {write-error $lstr_DiskMountedNoID } #No disk index
                }
            }
        }
    }
}    

