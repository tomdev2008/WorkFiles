

Function Select-VMExternalEthernet
{# .ExternalHelp  MAML-VMNetwork.XML
    param (
        [ValidateNotNullOrEmpty()]
        [string]$Server = "."   #Only makes sense to select on a single server
    )
    Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -query "Select * from Msvm_ExternalEthernetPort where isbound=false"  | 
        Select-list -property Name
}