

Function Add-VMFloppyDisk
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    Param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM,
        
        [parameter(Mandatory = $true)]
        [Alias("VFDPath")]
        $Path, 
        
        [ValidateNotNullOrEmpty()] 
        $Server=".",  #May need to look for VM(s) on Multiple servers 
        $PSC,
        [Switch]$Force 
    )
    process{
        if ($psc -eq $null)  {$psc = $pscmdlet} 
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Add-VMFloppyDisk -VM $_ @PSBoundParameters}}
        if ($VM.__CLASS -eq 'Msvm_ComputerSystem') { 
                if ($Path -is [System.IO.FileInfo] )    {$VFDPath = $Path.fullname }
                if ($Path -is [scriptblock])            {$VFDPath = Invoke-Expression ".{$Path}"  } 
                if ($Path -is [string])                 {$VFDPath = $path  } 
                if ($VFDPath -notmatch "(\w:|\w)\\\w")  {$VFDPath = (Get-VhdDefaultPath $Server) + "\" + $VFDPath }
                if ($VFDPath -notmatch "VFD$" )         {$VFDPath = $VFDPath + ".vfd"}
                if ($vm.__server -eq $env:COMPUTERNAME) {$VFDPath = (Resolve-Path $VFDPath -ErrorAction "silentlyContinue").path } 
                if ($VFDPath) {
                    $diskRASD=NEW-VMRasd -resType ([resourcetype]::StorageExtent) -resSubType 'Microsoft Virtual Floppy Disk' -server $vm.__Server 
                    $diskRASD.parent=(Get-WmiObject -computerName $vm.__server -NameSpace $HyperVNamespace -Query "Select * From MsVM_ResourceAllocationSettingData Where instanceId Like 'Microsoft:$($vm.name)%' and resourceSubtype = 'Microsoft Synthetic Diskette Drive'").__Path
                    $diskRASD.connection=$VFDPath
                    add-VmRasd -rasd $diskRasd -vm $vm -PSC $psc -force:$force 
                } 
        }
   }     
}