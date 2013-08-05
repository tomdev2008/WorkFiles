

Function Get-VMDriveByController
{# .ExternalHelp  MAML-VMDisk.XML
    Param (
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $Controller, 
        $LUN="%" 
    )
    process {
        if ($Controller.count -gt 1 ) {$Controller | ForEach-Object {Get-VMDriveByController -Controller  $_ -LUN $Lun} }
        if ($Controller.__CLASS -eq 'Msvm_ResourceAllocationSettingData') {
            $CtrlPath=$Controller.__Path.replace("\","\\")
            Get-WmiObject -computerName $controller.__server  -NameSpace $HyperVNamespace -Query "Select * From MsVM_ResourceAllocationSettingData Where PARENT='$ctrlPath' and Address Like '$Lun' "  | 
            Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($Controller.VMelementName) 
        }
    }
}