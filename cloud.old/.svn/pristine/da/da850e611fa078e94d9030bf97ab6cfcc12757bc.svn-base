

Function Set-VMDisk
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param([parameter(ParameterSetName="Path" , Mandatory = $true, ValueFromPipeline = $true , position=0)]
        $VM,
        
        [parameter(ParameterSetName="Path" , position=1)]
        [int]$ControllerID = 0,
        
        [parameter(ParameterSetName="Path", position=2)]
        [int]$LUN = 0 ,
        
        [parameter(Mandatory = $true, position=3)][Alias("VHDPath")][AllowEmptyString()]
        $Path,                     #May support script blocks in future
      
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()] 
        $server="." ,    #May need to look for VM(s) on Multiple servers
        
        [parameter(ParameterSetName="Path")]
        [switch]$SCSI, 
        
        [Alias("DVD")]
        [switch]$OpticalDrive,
        
        [parameter(ParameterSetName="Drive")]
        $DriveRASD,
        
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($pscmdlet.ParameterSetName -eq "Path") {
            if ($VM -is [String]) {$VM       =(Get-VM -Name $VM -server $Server) }
            if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VMDisk -VM $_ -psc $psc @PSBoundParameters}}
            if ($vm.__CLASS -eq 'Msvm_ComputerSystem') { 
                $DriveRASD= Get-VMDiskController -vm $vm -ControllerID $ControllerID -SCSI:$scsi -ide:$(-not $scsi) | Get-VMDriveByController -Lun $Lun 
            }
        }    
        if  ($DriveRasd.__CLASS -eq 'Msvm_ResourceAllocationSettingData') { 
            $DiskRASD = $DriveRASD | get-vmdiskByDrive 
            if ( $DiskRASD.__CLASS -eq 'Msvm_ResourceAllocationSettingData' )  {
                Write-Debug "Before resolution Path of VHD to mount is $Path"
                if ($path -is [System.IO.FileInfo])       {$MountPath  = $Path.fullName                }
                if ($Path -is [scriptblock])              {$MountPath  = Invoke-Expression ".{$Path}"  } 
                if ($Path -is [String])                   {$MountPath  = $path}
                
                If  ($opticalDrive -or ($driveRasD.caption -match "DVD")) {
                   if ($MountPath -match "^\w:$")         {$MountPath = $(Get-WmiObject -ComputerName $vm.__SERVER -Query "Select * From win32_cdromdrive where Drive='$MountPath'").deviceID }
                   else {Get-WmiObject -ComputerName $vm.__SERVER -Query "Select * From win32_cdromdrive" | ForEach-Object -begin {$CDDevices=@()} -process {$CDdevices += $_.deviceID}
                       if (($MountPath -notmatch "iso$") -and ($CDdevices -notcontains $MountPath)) 
                                                          {$MountPath += ".ISO"}
                   }
                }
                elseif ($MountPath -notmatch "VHD$" )     {$MountPath += ".VHD"}      
                
                if     ($MountPath -notmatch "(\w:|\w)\\\w") {$MountPath = (Get-VhdDefaultPath $diskRasd.__SERVER) +'\' +  $MountPath   }
                Write-Debug "After resolution Path of VHD to mount is $MountPath"
                
                $diskRASD.Connection = $MountPath
                Set-VMRASD -rasd $DiskRASD -psc $psc -force:$force  
            }    
            else {add-vmdisk @PSBoundParameters} # If the drive exists but the disk does not
        }
        else {add-vmdisk @PSBoundParameters} # if the drive doesn't exist
        
    }
}