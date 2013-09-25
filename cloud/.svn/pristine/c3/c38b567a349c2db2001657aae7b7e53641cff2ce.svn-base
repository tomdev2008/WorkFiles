$Lstr_DeleteVirtualSwtich = "Delete Virtual Switch" 


Function Remove-VMSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true , ConfirmImpact='High' )]
    param ( [parameter(valueFromPipeline = $true , Mandatory = $true)][ValidateNotNullOrEmpty()][Alias("name","VirtualSwitchName")]
            $VirtualSwitch,
            [int]$Ports=1024, 
            
            [ValidateNotNullOrEmpty()] 
            [string]$Server=".",   #Only allow one switch at once
            $PSC, 
            [Switch]$Force
    )
    process{
        if ($psc -eq $null)    { $psc = $pscmdlet }   
        if ($virtualSwitch -is [String]) {$virtualSwitch=get-vmswitch -server $server -VirtualSwitchName $virtualSwitch}
        if ($virtualSwitch.__CLASS -eq 'Msvm_VirtualSwitch') {
            $SwitchMgtSvc = Get-WMIObject -computername $server -namespace $HyperVNamespace -Query "select * from MSVM_VirtualSwitchManagementService"   
            $intSP        = Get-WmiObject -computername $server -Namespace $HyperVNamespace -Query "select * from msvm_vlanendpoint where elementName = '$($VirtualSwitch.ElementName)_InternalPort' "
            $ExtSP        = Get-WmiObject -computername $server -Namespace $HyperVNamespace -Query "select * from msvm_vlanendpoint where elementName = '$($VirtualSwitch.ElementName)_ExternalPort' "
            if ($force -or $psc.shouldProcess($virtualSwitch.elementname, $Lstr_DeleteVirtualSwtich)) {  
                if     ($expSP)    { $Result = $SwitchMgtSvc.TeardownSwitch($extSP,$intSP)   }
                elseif ($intSP)    { $result = remove-VMSwitchNIC -server $server -name $VirtualSwitch.ElementName -psc $psc -force:$true}
                $result = $SwitchMgtSvc.DeleteSwitch($virtualSwitch) 
                [returnCode]$result.returnValue
            }  
        }
    }
}