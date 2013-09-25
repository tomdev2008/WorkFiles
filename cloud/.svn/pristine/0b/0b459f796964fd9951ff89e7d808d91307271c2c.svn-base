$Lstr_SwitchPortRemoval = "Removal of the switch port returned {0}."


Function Set-VMNICSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)] 
        $NIC, 
        
        [Alias("name","VirtualSwitchName")]        
        $Virtualswitch ,
        $PSC, 
        [switch]$Force,
        # VM is preserved for backwards compatibility but is ignored
        $VM , $Server 
    ) 
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($NIC.count -gt 1  ) {[Void]$PSBoundParameters.Remove("NIC") ;  $NIC | ForEach-object {Set-VMNICSwitch  -NIC $_ @PSBoundParameters}}
        if ($nic.__CLASS -like "*EthernetPortSettingData")  {           
            if ($nic.connection) {$Oldport  = [wmi]$nic.connection[0]}
            if ($virtualSwitch ) {$Newport  = new-VmSwitchPort -virtualSwitch $virtualSwitch -Server $nic.__server}
            $nic.connection  = [string]$newPort 
            $vssd            = get-wmiobject -computername $nic.__Server -namespace $HyperVNamespace -query "associators of {$nic}  where resultclass=Msvm_VirtualSystemSettingData"
            $vm              = get-wmiobject -computername $nic.__Server -namespace $HyperVNamespace -query "associators of {$vssd} where resultClass=msvm_ComputerSystem" 
            $result = Set-VMRASD -vm $vm -rasd $NIC -psc $psc -force:$force
            if ($oldPort -and ($result -eq [returnCode]::OK) ) {     
                $SwitchMgtSvc=(Get-WmiObject -computerName $nic.__server -NameSpace  $HyperVNamespace   -Query "Select * From MsVM_VirtualSwitchManagementService") 
                $result2 = $SwitchMgtSvc.DeleteSwitchPort($oldport)
                write-Verbose ($Lstr_SwitchPortRemoval -f ([ReturnCode]$result2) )
            }  
            $result 
       }
    }
}

