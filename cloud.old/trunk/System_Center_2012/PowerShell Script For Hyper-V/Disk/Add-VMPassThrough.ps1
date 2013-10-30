

Function Add-VMPassThrough
{# .ExternalHelp  MAML-VMDisk.XML
   [CmdletBinding(SupportsShouldProcess=$true)] 
   Param(
         [parameter(ParameterSetName="Path" , Mandatory = $true, ValueFromPipeline = $true)]
        $VM,
        
        [parameter(ParameterSetName="Path" , Mandatory = $true)]
        [int]$ControllerID ,
        
        [parameter(Mandatory = $true)]
        [int]$LUN, 
     
        [parameter(Mandatory = $true)]
        $PhysicalDisk,
     
        
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()]
        $Server = ".",  #May need to look for VM(s) on Multiple servers if $physical disk is clustered
       
        [parameter(ParameterSetName="Path")]     
        [switch]$SCSI,
        
        [parameter(ParameterSetName="Drive")]
        $ControllerRASD,
       
        $PSC, 
        [switch]$Force
    )
    if ($psc -eq $null)  {$psc = $pscmdlet} 
    if ($pscmdlet.ParameterSetName -eq "Path") {
        if ($VM -is [String])  {$VM=(Get-VM -Name $VM -Server $server) }
        if ($SCSI) {$ControllerRASD=(Get-VMDiskController -vm $vm -ControllerID $ControllerID -SCSI)}
        else       {$ControllerRASD=(Get-VMDiskController -vm $vm -ControllerID $ControllerID -IDE) }
    }
    if ($pscmdlet.ParameterSetName -eq "Drive") {$vm=get-vm $ControllerRASD }
    if (($VM.__CLASS -eq 'Msvm_ComputerSystem') -AND  ($ControllerRASD.__CLASS -eq 'Msvm_ResourceAllocationSettingData')){ 
        $diskRASD = NEW-VMRasd -resType ([resourcetype]::disk)  -resSubType 'Microsoft Physical Disk Drive'   -server $vm.__Server
        $diskRASD.parent       = $ControllerRASD.__Path 
        $diskRASD.address      = $Lun
        $diskRASD.HostResource = [string]$PhysicalDisk.__path
        add-VmRasd -rasd $diskRasd -vm $vm -PSC $psc -force:$force  
 }
}