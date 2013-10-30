$lStr_SwitchCreatingFailure            = "Failed to create Virtual Switch {0} on server{1} the response was " 
$lStr_SwitchCreatingSuccess            = "Created Virtual Switch {0} on server{1}"
$lStr_SwitchCreating                   = "Create a new Virtual Switch named {0}"


Function New-VMPrivateSwitch 
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param ( [parameter(Mandatory = $true , ValueFromPipeLine = $true)][Alias("Name")]
            [ValidateNotNullOrEmpty()][string]$VirtualSwitchName,
            
            [int]$Ports=1024, 
            
            [ValidateNotNullOrEmpty()][string]$Server=".",  #Only allow a Switch to be created on a single server
            $PSC, 
            [switch]$Force
    )
    Process {
        if ($psc -eq $null) { $psc = $pscmdlet }
        $SwitchMgtSvc =  Get-WmiObject  -ComputerName $Server -NameSpace $HyperVNamespace -Query "Select * From MsVM_VirtualSwitchManagementService" 
        if ($force -or $psc.shouldProcess(($lStr_VirtualMachineName -f $vm.elementName ), ($lStr_SwitchCreating -f $virtualSwitchName ))) {
            $result=$SwitchMgtSvc.CreateSwitch( [system.guid]::NewGuid() , $virtualSwitchName , $Ports  ,$null )
            if ( ($result | Test-wmiResult -wait:$wait -JobWaitText ($lStr_SwitchCreating  -f $virtualSwitchName) `
                                           -SuccessText ( $lStr_SwitchCreatingSuccess -f $virtualSwitchName,$server) `
                                           -failText ($lStr_SwitchCreatingFailure -f $virtualSwitchName,$server )) -eq [returnCode]::ok) {
                [wmi]$Result.CreatedVirtualSwitch
            }
        }   
    }
}

