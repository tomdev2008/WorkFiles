

Function Get-VMBuildScript
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM = "%"  ,    
        
        [ValidateNotNullOrEmpty()]
        $Server="."  #May need to look for VM(s) on Multiple servers
    )
    Process { 
        if ($VM -is [String]) {$VM = Get-VM -Name $VM -server $Server }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VMBuildScript -VM $_ @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem')  {
              ("`n`n#Build Script for {0} created {1}`n" -f $VM.elementName, (Get-Date) )
              ("{0} = New-VM                  -Name '{1}' " -f '$VM' , $VM.elementName)
              $VMcpu = Get-VMCPUCount $VM
              ("Set-VMCPUCount                -VM   {0}  -CPUCount {1} -Limit {2} -Reservation {3} -Weight {4} " -f '$VM', $VMcpu.VirtualQuantity ,$VMcpu.Limit , $VMcpu.Reservation , $VMcpu.weight)
              $VMmem = Get-VMMemory -VM $VM
              if ($VMmem.DynamicMemoryEnabled) {("Set-VMMemory  -dynamic        -VM   {0}  -Memory   {1} -Limit {2} -Weight {3} -bufferPercentage {4}" -f '$VM', $VMmem.VirtualQuantity, $VMmem.Limit , $VMmem.Weight, $VMmem.TargetMemoryBuffer)} 
              else                             {("Set-VMMemory                  -VM   {0}  -Memory   {1}"                                              -f '$VM', $VMmem.VirtualQuantity) }
              $VMsd  = Get-VMSettingData -VM $VM  
              $VSGSD = get-wmiobject  -computername $VM.__SERVER -namespace $HyperVNamespace  -Query "associators of {$($VM.__path)} where resultclass=MsVM_VirtualSystemGlobalSettingData"
              ("Set-VM                        -VM   {0}  -BootOrder {1} -notes '{2}' -AutoRecovery {3} -AutoShutDown {4} -autoStartup {5} -AutoDelay {6} " -f '$VM' ,
                     ($VMSD.BootOrder  | foreach-object -begin {$bootDevices=""} -process {[string]$bootdevices += ([bootmedia]$_).tostring() +","} -end {$bootDevices -replace ",$","" }) ,
                     $VMsd.notes ,  [recoveryAction]$VSGSD.AutomaticRecoveryAction , [ShutdownAction]$vsgsd.AutomaticShutdownAction , [StartupAction]$vsgsd.AutomaticStartupAction,
                     [System.Management.ManagementDateTimeconverter]::ToTimeSpan($VSGSD.AutomaticStartupActionDelay).Seconds)


              Get-VMNIC -VM $VM | forEach-object {
                  if ($_.elementName -match "Legacy") {('$NIC = Add-VMNIC              -VM   {0}  -legacy'   -f '$VM')}
                  else                                {('$NIC = Add-VMNIC              -VM   {0}  -GUID {1}' -f '$VM', $_.VirtualSystemIdentifiers[0]) }    
                  if ($_.address -ne "000000000000")  {('Set-VMNICAddress              -NIC  $NIC -MAC {0}' -f $_.address ) }
                  $switch = (Get-VMNICSwitch ($_)).elementname
                  if ($switch)                        {('Set-VMNICSwitch               -NIC  $NIC -VirtualSwitch "{0}"' -f $switch) }
              }
              Get-VMSerialPort -VM $VM | foreach-Object {if ($_.connection[0]) {"Set-VMSerialport             -VM   {0}  -PortNumber {1} -connection {2}"  -f '$VM' , $_.elementName.replace("com ",""), $_.connection[0]}}
              Get-VMFloppyDisk -VM $VM | foreach-object {("Add-VMFloppyDisk              -VM   {0}  -Path {1}" -f '$VM', $_.Connection[0])}
              Get-VMDiskController -VM $VM -SCSI | foreach-object {
                  ('$DC = Add-VMSCSIController -VM   {0}  -name "{1}"' -f '$VM', $_.elementName)
                  Get-VMDriveByController -Controller $_ | foreach-object {
                      IF   ($_.ResourceSubType -match "Synthetic") {
                          ('$Drv = Add-VMDrive              -ControllerRASD $DC -LUN {0} ' -f $_.address )
                          Get-VMDiskByDrive -Drive $_ | foreach-object {if ($_.connection) {
                              $p=$_.Connection[0] ; while ($p.toupper().EndsWith(".AVHD")) { $p=(Get-VHDInfo -vhdpath $p -Server $_.__server ).parentPath }
                              ('Add-VMDisk                     -DriveRASD $Drv -Path {0} ' -f  $P )
                          }}    
                      }
                      elseif ($_.ResourceSubType -match "Physical") {'Add-vmpassThrough -ControllerRASD $DC -LUN {0} -physicalDisk [wmi]''{1}''' -f $_.address , $_.HostResource[0]}
                  }     
              }
              Foreach ($ID in @(0,1)) {Get-VMDiskController -VM $VM -ide -ControllerID $ID | foreach-object {
                  Get-VMDriveByController -Controller $_ | foreach-object {
                  IF  ($_.ResourceSubType -match "Synthetic") {
                          ('$Drv = Add-VMDrive            -VM   {0}  -ControllerID {1} -LUN {2} -OpticalDrive:${3}' -f '$VM' , $ID , $_.address, ($_.elementName -notmatch "Hard"))
                          Get-VMDiskByDrive -Drive $_ | foreach-object {if ($_.connection) {
                              $p=$_.Connection[0] ; while ($p.toupper().EndsWith(".AVHD")) { $p=(Get-VHDInfo -vhdpath $p -Server $_.__server ).parentPath }
                              ('Add-VMDisk                    -Dri  $Drv -Path {0} -OpticalDrive:${1}' -f  $P , ($_.elementName -notmatch "Hard"))
                          }}
                  } 
                  elseif ($_.ResourceSubType -match "Physical") {'Add-vmpassThrough           -VM   {0}  -ControllerID {1} -LUN {2} -physicalDisk [wmi]''{3}''' -f '$VM' , $ID , $_.address , $_.HostResource[0]}
                          
                 }
              }}
              Get-VMIntegrationComponent $VM | Where-Object {$_.enabledstate -eq [VMstate]::Stopped} | ForEach-Object { "Set-VMIntegrationComponent -VM   {0} -componentName '{1}' -state [VMstate]::stopped" -f  '$VM',$_.elementName }
              Get-vmClusterGroup $vm | ForEach-Object {  "Add-ClusterVirtualMachineRole -Name {0} -VirtualMachine{1}" -f $_.name,$_.vmelementname }
       }
   }
} 