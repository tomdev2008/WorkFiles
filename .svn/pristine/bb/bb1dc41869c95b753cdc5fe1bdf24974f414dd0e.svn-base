$lstr_LegacyNicLabel = "Legacy Network Adapter"
$lstr_VMBusNicLabel  = "VM-Bus Network Adapter"

Function Add-VMNIC
{# .ExternalHelp  MAML-VMNetwork.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [Alias("switch","VirtualSwitchName")]
        $VirtualSwitch,           
        
        [ValidatePattern('^[0-9|a-f]{12}$')]
        [String]$MAC,
        [string]$GUID=("{"+[System.GUID]::NewGUID().ToString()+"}") ,
        
        [ValidateNotNullOrEmpty()] 
        $Server = ".",   #May need to look for VM(s) on Multiple servers

        [switch]$Legacy , 
        $PSC, 
        [switch]$Force
        )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM = (Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {add-VmNic -VM $_ @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            if ($Legacy)         {$NicRASD = NEW-VMRasd -server $vm.__Server -resType ([resourcetype]::EthernetAdapter) -resSubType 'Microsoft Emulated Ethernet Port' 
                                  $NicRASD.ElementName = $lstr_LegacyNicLabel
            }  
            else                 {$NicRASD = NEW-VMRasd -server $vm.__Server -resType ([resourcetype]::EthernetAdapter) -resSubType  'Microsoft Synthetic Ethernet Port' 
                                  $NicRASD.VirtualSystemIdentifiers=@($GUID)
                                  $NicRASD.ElementName = $lstr_VMBusNicLabel
            }     
            if ($mac )           {$nicRasD.address          = $mac
			                      $nicRasD.StaticMacAddress = $true
            }
            if ($virtualSwitch ) {$nicRasD.connection = [string](new-VmSwitchPort -virtualSwitch $virtualSwitch -Server $VM.__server)}
            add-VmRasd -rasd $NicRasd -vm $vm -PSC $psc -force:$force
       }
   }
}
