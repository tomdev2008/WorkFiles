

Function Add-VMDrive
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(ParameterSetName="Path" , Mandatory = $true, position=0, ValueFromPipeline = $true)]
        $VM,
        
        [parameter(ParameterSetName="Path" , Mandatory = $true, position=1)]
        [int]$ControllerID ,
        
        [parameter(Mandatory = $true, position=2)]
        [int]$LUN, 
        
        [parameter(ParameterSetName="Drive")]
        $ControllerRASD,
        
        [parameter(ParameterSetName="Path")][ValidateNotNullOrEmpty()]
        $Server = ".",  #May need to look for VM(s) on Multiple servers
       
        [Alias("DVD")]
        [switch]$OpticalDrive,
        
        [parameter(ParameterSetName="Path")]
        [switch]$SCSI,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM  -is [string]) { $VM = Get-VM -Name $VM -Server $Server}
        if ($VM.count -gt 1 )  { [Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-VMDrive -VM $_  @PSBoundParameters}}
        if ($pscmdlet.ParameterSetName -eq "Path") {
            if ($SCSI)            {$ControllerRASD=(Get-VMDiskController -VM $VM -ControllerID $ControllerID -SCSI)}
            else                  {$ControllerRASD=(Get-VMDiskController -VM $VM -ControllerID $ControllerID  -IDE)}
        }    
        if ($pscmdlet.ParameterSetName -eq "Drive") {$vm=get-vm $ControllerRASD }
        if (($VM.__CLASS -eq 'Msvm_ComputerSystem') -and ($ControllerRASD.__class -eq 'Msvm_ResourceAllocationSettingData') ) {
            if ($OpticalDrive)  { $diskRASD = New-VMRASD -ResType ([ResourceType]::DVDDrive) -ResSubType "Microsoft Synthetic DVD Drive"  -Server $VM.__Server}
            else                { $diskRASD = New-VMRASD -ResType ([ResourceType]::Disk)     -ResSubType "Microsoft Synthetic Disk Drive" -Server $VM.__Server}
            $diskRASD.Parent  = $ControllerRASD.__Path 
            $diskRASD.Address = $LUN
            add-VmRasd -rasd $diskRasd -vm $vm -PSC $psc -force:$force
        }
    }    
}