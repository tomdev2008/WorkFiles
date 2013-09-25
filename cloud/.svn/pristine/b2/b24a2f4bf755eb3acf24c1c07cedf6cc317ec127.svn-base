$Lstr_ModifyVMSettingaction = "Modify VM Settings object"
$Lstr_ModifiedVMSettings = "Modified VM Settings object for {0}"
$Lstr_ModifyVMSettingsFailed = "Could not Modify VM Settings Object for {0} "
$Lstr_ModifiedVMGlobalSettings = "Modified VM Global Settings object for {0}"
$Lstr_ModifyVMGlobalSettingsFailed = "Could not Modify VM Global Settings Object for {0} "
$Lstr_ModifyVMGlobalSettingaction = "Modify VM Global Settings object"
$Lstr_BootOrderDuplicate = "An item appeared more than once in the boot order"


Function Set-VM
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    Param(
      [parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)]
      $VM, 
      
      [string]$Name, 
      [BootMedia[]]$BootOrder, 
      [String]$Notes, 
      [recoveryAction]$AutoRecovery, 
      [ShutDownAction]$AutoShutDown, 
      [Startupaction]$AutoStartup, 
      [Int]$AutoDelay, 
      [ValidateNotNullOrEmpty()]
      $Server=".",       #May need to look for VM(s) on Multiple servers
      $PSC, 
      [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Set-VM -VM $_  @PSBoundParameters}} 
        if (($vm.__CLASS -eq 'Msvm_ComputerSystem') -or ($vm.__CLASS -eq 'Msvm_VirtualSystemSettingData')) {
            $VSMgtSvc=Get-WmiObject -computerName $VM.__server -NameSpace $HyperVNamespace -Class "MsVM_virtualSystemManagementService"
            if ($Name -or $notes -or $BootOrder) { 
                $VSSD=(Get-VMSettingData $VM)
	            if ($vm -eq $vssd) { $vm = Get-WmiObject -computername $vssd.__SERVER -namespace $HyperVNamespace -Query "select * from MSVM_Computersystem where name ='$($vssd.systemName)'"}
                if ($Name      )   { $VSSD.ElementName = $Name }
                if ($notes     )   { $VSSD.notes       = $Notes }
                if ($BootOrder )   {if   (($bootOrder | Group-Object | where-object {$_.count -gt 1}) -ne $null) {write-warning $Lstr_BootOrderDuplicate}
                                    else {$VSSD.BootOrder=$BootOrder} }
                if ($force -or $psc.shouldProcess($vm.ElementName , $Lstr_ModifyVMSettingaction)) {
                    $result = $VSMgtSvc.ModifyVirtualSystem($VM , $VSSD.GetText([System.Management.TextFormat]::WmiDtd20) )
                    if   ($Result.ReturnValue -eq [returnCode]::ok) { ($Lstr_ModifiedVMSettings -f $vm.elementname) } 
                    else  {write-error ($Lstr_ModifyVMSettingsFailed -f $vm.elementname) }
                }
            }
            If (($AutoRecovery) -or ($AutoShutDown ) -or ($AutoStartup ) -or ($AutoDelay ) ) {
                $VSGSD=get-wmiobject  -computername $vm.__SERVER -namespace $HyperVNamespace  -Query "associators of {$($vm.__path)} where resultclass=Msvm_VirtualSystemGlobalSettingData"
                if ($AutoRecovery ) {$VSGSD.AutomaticRecoveryAction     = $AutoRecovery }
                if ($AutoShutDown ) {$VSGSD.AutomaticShutdownAction     = $AutoShutdown }
                if ($AutoStartup  ) {$VSGSD.AutomaticStartupAction      = $autoStartup  }
                if ($AutoDelay    ) {$VSGSD.AutomaticStartupActionDelay = [System.Management.ManagementDateTimeconverter]::ToDmtfTimeInterval((New-TimeSpan -Seconds $AutoDelay)) }
                if ($force -or $psc.shouldProcess($vm.ElementName , $Lstr_ModifyVMGlobalSettingaction)) {
                     $result = $VSMgtSvc.ModifyVirtualSystem($VM , $VSGSD.GetText([System.Management.TextFormat]::WmiDtd20) )
                     if    ($Result.ReturnValue -eq [returnCode]::ok) { $Lstr_ModifiedVMGlobalSettings -f $vm.elementname } 
                     else  {write-error ($Lstr_ModifyVMGlobalSettingsFailed -f $vm.elementname)}
                }
            }
        }
    }
}
