


Function Get-VhdDefaultPath
{# .ExternalHelp  MAML-VMDisk.XML
    param ([ValidateNotNullOrEmpty()]
           [String]$Server=".")    #Only work with images on one server  
    (Get-WmiObject -computerName $server -NameSpace $HyperVNamespace -Class "MsVM_VirtualSystemManagementServiceSettingData").DefaultVirtualHardDiskPath -replace "\\$",""
}