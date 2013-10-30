$LStr_CPUScalesWarning             = "Reservation and Limit are scaled from 0 to 100,000. A value below 100 is less than 0.1%"

Function Set-VMCPUCount
{# .ExternalHelp  MAML-VMConfig.XML
   [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $VM,     
        
        [ValidateRange(1,4)]
        $CPUCount ,         
        $Limit, 
        $Reservation,
        $Weight,
        
        [ValidateNotNullOrEmpty()]
        $Server = ".",       #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($psc -eq $null) { $psc = $pscmdlet ;  $PSBoundParameters.add("psc",$psc) }
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -server $server) }
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VMCPUCount -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $procsSettingData=Get-VMCpuCount $VM 
            if ((($reservation -gt 0 -and $reservation -lt 100)) -or (($limit -gt 0) -and ($limit -lt 100))) {write-warning $LStr_CPUScalesWarning}
            if ($CPUCount    -ne $null) {$procsSettingData.VirtualQuantity=$CPUCount}
            if ($Reservation -ne $null) {$procsSettingData.Reservation = $Reservation}
            if ($Limit       -ne $null) {$procsSettingData.Limit = $Limit}
            if ($Weight      -ne $null) {$procsSettingData.weight = $Weight}
            Set-VMRASD -vm  $vm -rasd $procsSettingData -psc $psc             
        }
    }
 
}
