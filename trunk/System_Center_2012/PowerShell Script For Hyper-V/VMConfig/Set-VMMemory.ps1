

Function Set-VMMemory
{# .ExternalHelp  MAML-VMConfig.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        $VM, 
        
        [Alias("MemoryInBytes")]
        [long]$Memory = 0 , 
        [long]$limit            = $memory , 
        [long]$Weight           = 1000 ,
        [ValidateRange(5,2000)]
        [long]$BufferPercentage = 20 ,
        
        [Switch]$Dynamic ,
        
        $Server = ".",       #May need to look for VM(s) on Multiple servers
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) { $VM = Get-VM -Name $VM -Server $Server}
        if ($VM.count -gt 1 )  {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VMMemory -VM $_ @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
	       $SettingData  = Get-VMMemory -VM $VM
           if ($memory -eq 0)           {$memory  = $SettingData.VirtualQuantity   }
           if ($limit  -eq  0)          {$limit   = $SettingData.Limit }
           # The API takes the amount of memory in MB, in multiples of 2MB. 
           # Assume that anything less than 2097152 is in aready MB (we aren't assigning 2TB to the VM). If user enters "1024MB" or 0.5GB divide by 1MB  
           
           if (-not ($memory % 2mb))  {$memory /= 1mb}
           if (-not ($Limit  % 2mb))  {$Limit  /= 1mb}
           
           if ($dynamic)  {  $settingData.DynamicMemoryEnabled = $True 
                               $settingData.TargetMemoryBuffer = $BufferPercentage 
                                           $settingData.Weight = $weight
                                            $SettingData.Limit = $limit
                                      $SettingData.Reservation = $SettingData.VirtualQuantity = $memory } 
           else {$SettingData.Limit = $SettingData.Reservation = $SettingData.VirtualQuantity = $Memory 
                             $settingData.DynamicMemoryEnabled = $false}
           Set-VMRASD -vm  $vm -rasd $SettingData -psc $psc  
        }
    }
}
