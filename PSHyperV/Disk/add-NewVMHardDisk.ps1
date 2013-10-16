

Function Add-VMNewHardDisk 
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM,
        [int]$ControllerID=0, 
        [int]$LUN=0, 
        
        [ValidateNotNullOrEmpty()]
        $VHDPath, 
           
        [ValidateRange(1,2040GB)]
        [long]$Size = 127GB, 
        
        [ValidateNotNullOrEmpty()][Alias("ParentDiskPath","ParentPath")]
        $ParentVHDPath,
        
        [ValidateNotNullOrEmpty()] 
        [string]$Server = ".", 
        [switch]$Fixed, 
        [switch]$SCSI,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String])                    {$VM = Get-VM -Name $VM -Server $Server}
        if ($VM.count -gt 1  -and -not $VHdPath) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-VMNewHardDisk  -VM $_  @PSBoundParameters}}
        if ($VHDPath -is [scriptblock])          {$NewVHD  = Invoke-Expression ".{$VHDPath}"  } 
        if ($VM.__CLASS -eq 'Msvm_ComputerSystem')  {        	
            if (-not $NewVHD) { $NewVHD = (Get-VhdDefaultPath $vm.__Server) + "\" + ($vm.elementname + ".VHD")             }
            if ($parentDisk)   { $vhd = New-VHD -wait -Psc $PSC -force:$force -Server $VM.__Server -VhdPath $NewVHD -parentDisk $ParentDisk  }
            elseif ($fixed)    { $vhd = New-VHD -wait -Psc $PSC -force:$force -Server $VM.__Server -VhdPath $NewVHD -Size $size -Fixed       }
            else               { $vhd = New-VHD -wait -Psc $PSC -force:$force -Server $VM.__Server -VhdPath $NewVHD -Size $size              }
            $drive = Add-VMDRIVE -psc $PSC -force:$force -VM $VM -ControllerID  $ControllerID -LUN $LUN -scsi:$scsi                              
                     Add-VMDISK  -psc $PSC -force:$force -DriveRASD $Drive -VHDPath $vhd.path
        }
    }    
}
