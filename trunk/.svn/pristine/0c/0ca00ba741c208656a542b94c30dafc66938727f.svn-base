$lStr_VMStateChanging      = "Change state to {0}"
$lStr_VMStateChangeFail    = "Failed to change state of VM {0} to: {1}"
$lStr_VMStateChangeSuccess = "Sucessfully changed state of VM {0} to: {1}"
$lStr_VMStateWaiting       = "Change state of VM {1} to {0} "

Function Set-VMState 
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [parameter(Mandatory = $true)]
        [VMState]$State, 
        
        [ValidateNotNullOrEmpty()]
        $Server = "." ,     #May need to look for VM(s) on Multiple servers
        [switch]$Wait,
        $PSC, 
        [switch]$Force
    )
    Process {
        if ( $psc -eq $null)    { $psc = $pscmdlet ;  if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc) }}   
        if ( $VM -is [String])  { $VM = $(Get-VM -Name $VM -Server $Server)}
        if ( $VM.count -gt 1 )   { [Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VmState -VM $_ @PSBoundParameters}}
        if (($vm.__CLASS -eq 'Msvm_ComputerSystem') -and ($force -or $psc.shouldProcess($vm.ElementName, ($lStr_VMStateChanging -f $State)))) {     
                 $VM.RequestStateChange($State) | Test-wmiResult -wait:$wait -JobWaitText ($lStr_VMStateWaiting -f $State, $Vm.elementName ) `
                            -SuccessText ($lStr_VMStateChangeSuccess -f $Vm.elementName,$State)  -failText ($lStr_VMStateChangeFail -f $Vm.elementName,$state) 
        }
         
    }
}