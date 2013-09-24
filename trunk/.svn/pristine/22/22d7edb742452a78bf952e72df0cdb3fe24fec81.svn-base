$lstr_NoNICProvided                 = "No valid network card was provided"
$lstr_ExternalSwitchSetup           = "Configuring External Switch {0}"
$lstr_ExternalSwitchSetupSuccess    = "Successfully created the external Switch {0} on Server {1}"
$lstr_ExternalSwitchSetupFailure    = "Failed to create the external Switch {0} on Server {1}"  
$lStr_ExternalNictoSwtich           = "Use Host network card for an external virtual network"

Function New-VMExternalSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$True , ConfirmImpact='High')]
    param ( 
        [ValidateNotNullOrEmpty()][Alias("Name")]
        [string]$VirtualSwitchName,           
            
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateNotNullOrEmpty()]$ExternalEthernet,
        [int]$Ports=1024, 
            
        [ValidateNotNullOrEmpty()] 
        [String]$Server=".",  #Only allow a Switch to be created on a single server
        [switch]$Force
    )
    Process {
        if ($ExternalEthernet -is [String]) {
              $ExternalEthernet=(Get-WmiObject -computername $server -NameSpace  $HyperVNamespace `
                                              -query "Select * from Msvm_ExternalEthernetPort where Name like '$ExternalEthernet%' " `
                                |  sort-object -property name | select-object -first 1)
        }
        if ($ExternalEthernet.__CLASS -eq 'Msvm_ExternalEthernetPort') {
            If  (-not $virtualSwitchName ) {$virtualSwitchName=$ExternalEthernet.name + " Virtual NIC"}
  	    if ($force -or $pscmdlet.shouldProcess($ExternalEthernet.name, $lStr_ExternalNictoSwtich)) {
                $Switch       = New-VMPrivateSwitch $virtualSwitchName $ports $server -force:$force
                if ($Switch) { 
                   $intSP    = New-VMSwitchPort -virtualSwitch $switch -name ($virtualSwitchName + "_InternalPort") 
                   $ExtSP    = New-VMSwitchPort -virtualSwitch $switch -name ($virtualSwitchName + "_ExternalPort")
                   if ($intSP -and $extSP) { 
                       $SwitchMgtSvc = Get-WmiObject -ComputerName $Server -NameSpace $HyperVNamespace -Query "Select * From MsVM_VirtualSwitchManagementService"
                       $Result       = $SwitchMgtSvc.SetupSwitch($ExtSp, $intSp, $ExternalEtherNet.__path, $virtualSwitchName, $virtualSwitchName)
                  
                       if ( ($result | Test-wmiResult -wait -JobWaitText ($lstr_ExternalSwitchSetup  -f $virtualSwitchName) `
                                                      -SuccessText ( $lstr_ExternalSwitchSetupSuccess -f $virtualSwitchName,$server) `
                                                      -failText ($lstr_ExternalSwitchSetupFailure -f $virtualSwitchName,$server )) -eq [returnCode]::ok) {$switch}
                    }
                }
            }               # if port or switch creation causes an error that will be seen in those functions 
        }    
        else                {Write-warning  $lstr_NoNICProvided }
   }
}  
