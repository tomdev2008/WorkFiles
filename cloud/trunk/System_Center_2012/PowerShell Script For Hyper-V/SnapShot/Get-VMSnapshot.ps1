

Function Get-VMSnapshot
{# .ExternalHelp  MAML-VMSnapshot.XML
    Param(
      [parameter(Position=0 ,  ValueFromPipeline = $true)]
      $VM = "%", 
      [String]$Name="%",
      
      [ValidateNotNullOrEmpty()]  
      $Server="." ,
      [Switch]$Current,  
      [Switch]$Newest, 
      [Switch]$Root
    )
    process{
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object { Get-VMSnapshot -VM $_  @PSBoundParameters}} 
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            if ($current)  {Get-wmiobject -computerName $vm.__server -Namespace $HyperVNamespace -q "associators of {$($vm.path)} where assocClass=MSvm_PreviousSettingData"}
            else {$Snaps=Get-WmiObject -computerName $vm.__server -NameSpace $HyperVNameSpace -Query "Select * From MsVM_VirtualSystemSettingData Where systemName='$($VM.name)' and instanceID <> 'Microsoft:$($VM.name)' and elementName like '$name' " 
                if   ($newest) {$Snaps | sort-object -property creationTime | select-object -last 1 } 
                elseif ($root) {$snaps | where-object {$_.parent -eq $null} }
                else           {$snaps}
            }
        }
    }
}

