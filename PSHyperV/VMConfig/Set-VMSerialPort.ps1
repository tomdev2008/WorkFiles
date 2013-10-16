

Function Set-VMSerialPort
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [Alias("PortNo")][ValidateNotNullOrEmpty()][ValidateRange(1,2)]
        [int]$PortNumber = 1, 
        

        [String]$Connection,   #need to allow empty string
        
        [ValidateNotNullOrEmpty()]
        $Server = ".",         #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) { $VM = Get-VM -Name $VM -Server $Server }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VMSerialPort -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            write-debug "Connecting serial port $portNumber to $connection"   
            $comPortRASD = Get-VMSerialPort -VM $VM -PortNumber $PortNumber      
            $comPortRASD.Connection = $Connection
            Set-VMRASD -vm $vm -rasd $ComPortRASD -psc $psc
        }
    }
}