$lstr_CreateSwitchPortSuccess = "Created VirtualSwitchPort on switch {0}"
$lStr_CreateSwitchPortFailure = "Failed to create VirtualSwitchPort on switch {0}, return code {1}"


Function New-VMSwitchPort
{# .ExternalHelp  MAML-VMNetwork.XML
    Param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VirtualSwitch ,
        
        [String]$Name=([System.GUID]::NewGUID().ToString()),   
        
        [ValidateNotNullOrEmpty()] 
        [string]$Server = "."    #Only allow a Switch to be created on a single server
    ) 
    # Intentionally Does not support Should process as it should not be run from the command line. 
    if ($Virtualswitch -is [String]) {$Virtualswitch=Get-vmSwitch -name $virtualSwitch -server $server}
    if ($Virtualswitch.__class -eq 'Msvm_VirtualSwitch')  {
        $SwitchMgtSvc=(Get-WmiObject -computerName $Virtualswitch.__server -NameSpace  $HyperVNamespace   -Query "Select * From MsVM_VirtualSwitchManagementService")
        $result = $SwitchMgtSvc.CreateSwitchPort($Virtualswitch.__Path, $name, $name) 
        if ($result.returnValue -eq 0) {@($result.CreatedSwitchPort) 
                                        write-verbose ($lstr_CreateSwitchPortSuccess -f $virtualSwitch.elementName )
        }
        else                           {write-error   ($lStr_CreateSwitchPortFailure -f $virtualSwitch.elementName, $Result)}
    }
}

