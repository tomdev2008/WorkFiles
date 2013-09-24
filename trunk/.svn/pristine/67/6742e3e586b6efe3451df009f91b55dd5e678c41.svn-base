

Function Get-VMFloppyDisk
{# .ExternalHelp  MAML-VMDisk.XML
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM="%",
        
        [ValidateNotNullOrEmpty()] 
        $Server="."
    )
    process {
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VMFloppyDisk -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            Get-WmiObject -computerName $vm.__server -NameSpace $HyperVNamespace -Query "Select * From MsVM_ResourceAllocationSettingData Where instanceId Like 'Microsoft:$($vm.name)%' and resourceSubtype = 'Microsoft Virtual Floppy Disk'"}
   }
}