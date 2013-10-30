

Function New-VMRASD
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        [int]$ResType,   # The integers here are defined in the enum resourcetype.
                         # Needed as [int] below, and never passed as strings. 
        
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]
        [string]$ResSubType, 
        
        [ValidateNotNullOrEmpty()]
        [string]$Server = "."  #Only create resource allocation settings data objects on one server
    )
    
    $ac = ((Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace `
        -Query "SELECT * FROM MSVM_AllocationCapabilities WHERE ResourceType = $ResType AND ResourceSubType = '$ResSubType'").__Path).Replace("\", "\\")
    
    New-Object System.Management.ManagementObject((Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace `
        -Query "SELECT * FROM MSVM_SettingsDefineCapabilities WHERE ValueRange=0 AND GroupComponent = '$ac'").PartComponent)
}