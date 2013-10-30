

Function Select-VMPhysicalDisk 
{# .ExternalHelp  MAML-VMDisk.XML
  Param ([ValidateNotNullOrEmpty()] 
         [String]$Server = "." #only check one server
        )  
  $respool = get-wmiobject -computername $server -Namespace root\virtualization -query "Select * from Msvm_ResourcePool where ResourceSubType = 'Microsoft Physical Disk Drive'"
  Select-list -Property @("elementName") -InputObject $respool.getRelated("Msvm_DiskDrive") #(get-wmiobject -Namespace root\virtualization -query "associators of {$respool} where resultClass=Msvm_DiskDrive" ) 
}
#If you need to see how the disks map on to indexes which appear in the names "Disk 1" "Disk 2" use the following
# get-wmiobject win32_diskdrive | ft -a Index,Model,MediaType,@{label="Type";expression={$_.interfaceType}},SCSIBus,SCSIPort,@{Label="SCSILUN";expression={$_.SCSILogicalUnit}},SCSITartgetID,@{Label="Size";expression={(($_.size)/1Gb).tostring("#,##.0GB")}}
