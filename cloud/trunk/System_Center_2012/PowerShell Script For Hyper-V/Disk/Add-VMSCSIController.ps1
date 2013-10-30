$lstr_VMBusSCSILabel = "VMBus SCSI Controller"


Function Add-VMSCSIController
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)] 
        $VM,     
        [String]$Name=$lstr_VMBusSCSILabel,
        
        [ValidateNotNullOrEmpty()] 
        $Server = ".",     #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-VMSCSIController -VM $_ @PSBoundParameters}}
        if ($VM.__CLASS -eq 'Msvm_ComputerSystem') {
            $SCSIRASD=NEW-VMRasd -ResType ([resourcetype]::ParallelSCSIHBA) -ResSubtype 'Microsoft Synthetic SCSI Controller' -Server $vm.__Server
            $SCSIRASD.elementName=$name
            add-VmRasd -rasd $SCSIRasd -vm $vm -PSC $psc -force:$force
       }
    }     
}