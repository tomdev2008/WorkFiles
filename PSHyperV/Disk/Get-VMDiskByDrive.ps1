

Function Get-VMDiskByDrive
{# .ExternalHelp  MAML-VMDisk.XML
    Param (
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $Drive
    )
    process { 
        if ($Drive.count -gt 1 ) {$Drive | ForEach-Object {get-vmdiskByDrive -Drive $_} }
        if ($Drive.__CLASS -eq 'Msvm_ResourceAllocationSettingData') {
            If ($Drive.ResourceSubType -eq "Microsoft Physical Disk Drive") {$Drive}
            else {
                $DrivePath=$Drive.__Path.replace("\","\\")
                Get-WmiObject -computerName $drive.__server -Query "Select * From MsVM_ResourceAllocationSettingData Where PARENT='$DrivePath' " -NameSpace $HyperVNamespace |
                Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($Drive.VMelementName) 
            }
        }
    }
}