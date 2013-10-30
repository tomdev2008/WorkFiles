    

Function Set-VMRemoteFXController
{# .ExternalHelp  MAML-vmConfig.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        [parameter(ParameterSetName="Path" , Mandatory = $true, ValueFromPipeline = $true , position=0)]
        $VM,
        
        [int][validateRange(1,4)]$Monitors , 
        [RemoteFxResoultion]$Resolution ,
        
        
        [parameter(ParameterSetName="Controller")]
        $RFxRASD,
        
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()] 
        $Server = ".",     #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)   {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($pscmdlet.ParameterSetName -eq "Path") {
            if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
            if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VMRemoteFXController -VM $_ @PSBoundParameters}}
            if ($VM.__CLASS -eq 'Msvm_ComputerSystem') {  
                $RFXRASD=Get-VMRemoteFXController $VM
                if ($RFXRASD -eq $null) {Add-VMRemoteFXController @PSboundParameters }
            }    
        }    
        if ($RFXRASD.count -gt 1 ) {[Void]$PSBoundParameters.Remove("RFXRASD") ; $RFXRASD | ForEach-object {Set-VMRemoteFXController -RFXRASD $_ @PSBoundParameters}}
        if ($RFXRASD.__CLASS -eq 'Msvm_Synthetic3DDisplayControllerSettingData') { 
     
                        if ($Monitors)   { $RFXRASD.MaximumMonitors         = $Monitors   }
                        if ($Resolution) { $RFXRASD.MaximumScreenResolution = $Resolution }
                        Set-VmRasd -rasd   $RFXRASD -PSC $psc -force:$force
        }
    }
}            
