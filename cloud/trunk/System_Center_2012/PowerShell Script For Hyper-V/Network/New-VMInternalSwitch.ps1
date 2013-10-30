$lstr_boundInternalEthernetSuccess = "Bound Internal Ethernet adapter to Switch Port"
$lstr_boundInternalEthernetFailure = "Failed to Bind Internal Ethernet adapter to Switch port, result code {0}" 
$lstr_CreateVirtualNICFailed       = "Failed to Create internal ethernet adapter" 
$lstr_CreateVirtualNICSuccess      = "Created internal ethernet adapter" 


Function New-VMInternalSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ( [parameter(Mandatory = $true,  ValueFromPipeLine = $true)][Alias("Name")]
            [ValidateNotNullOrEmpty()][string]$VirtualSwitchName,
            [int]$Ports=1024, 
            
            [ValidateNotNullOrEmpty()] 
            [string]$Server=".",   #Only allow a Switch to be created on a single server
            [Switch]$force
    )
    Process {         
        $Switch       =  New-VMPrivateSwitch -virtualSwitchName $virtualSwitchName -ports $ports -server $server -psc $pscmdlet -force:$force
        if ($Switch) {
            $intSP        =  New-VMSwitchPort -virtualSwitch $switch # -name ($virtualSwitchName + "_InternalPort") 
            $SwitchMgtSvc =  Get-WmiObject  -ComputerName $Server  -NameSpace $HyperVNamespace -Query "Select * From MsVM_VirtualSwitchManagementService" 
            $result=$SwitchMgtSvc.CreateInternalEthernetPortDynamicMac($virtualSwitchName,$virtualSwitchName)
            if ($Result.ReturnValue -eq 0) { 
                write-Verbose $lstr_CreateVirtualNICSuccess  
                $endPoint = ([wmi]$result.CreatedInternalEthernetPort).getrelated("Msvm_SwitchLANEndpoint") #(Get-WmiObject  -NameSpace $HyperVNamespace -Query "ASSOCIATORS OF {$($result.CreatedInternalEthernetPort)} where resultClass = Msvm_SwitchLANEndpoint")
                $intSP    = New-VMSwitchPort -virtualSwitch $switch -name ($virtualSwitchName + "_InternalPort") 
                if ($intSP -and $endPoint) {
                    $result=$SwitchMgtSvc.ConnectSwitchPort($intSP, $endPoint )
	                if ($Result.returnValue -eq 0) {write-Verbose $lstr_boundInternalEthernetSuccess  
                                                $Switch
                    }
                }
                else  {write-warning ($lstr_boundInternalEthernetFailure -f $Result.returnValue) }
             }
             else     {Write-warning ($lstr_CreateVirtualNICFailed       -f $Result.returnValue) }
         }
     }
}
