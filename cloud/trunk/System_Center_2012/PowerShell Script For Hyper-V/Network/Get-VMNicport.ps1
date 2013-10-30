

Function Get-VMNICport
{# .ExternalHelp  MAML-VMNetwork.XML
    Param ( [parameter(Mandatory = $true, ValueFromPipeline = $true)]
            $NIC
    ) 
    Process { if ($nic.connection) {[wmi]$nic.connection[0]} }
}