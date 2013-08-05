

Function Get-VMDiskController
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding()]
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM = "%" ,
        
        $ControllerID="*",
        
        [ValidateNotNullOrEmpty()] 
        $Server = ".",  #May need to look for VM(s) on Multiple servers
        
        [switch] $SCSI,
        
        [switch]$IDE
    )
    Process { get-vmsettingData -vm $vm -server $SERVER | foreach-object {
                $VMRASD = $_.getRelated("MSVM_ResourceAllocationSettingData")
 #               $VMRASD = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Query "ASSOCIATORS OF {$_} where ResultClass = MSVM_ResourceAllocationSettingData"
                if ((-not ($scsi -xor  $IDE)) -and ($ControllerID -eq "*"))  {
                     $VMRASD |  Where-Object {($_.ResourceSubType -eq 'Microsoft Emulated IDE Controller') -or ($_.ResourceSubType -eq 'Microsoft Synthetic SCSI Controller')}
                }
                elseif ($scsi) {
                    $controllers =  $VMRASD | Where-Object {$_.ResourceSubType -eq 'Microsoft Synthetic SCSI Controller'}
    		            if ($controllerID -ne "*") {$controllers | select-object -first ([int]$controllerID + 1)  | Select-Object -last 1  }
                        else                       {if ($controllers) {$controllers}  }
                }    
                elseif ($IDE) { $VMRASD |  where-object  {($_.ResourceSubType -eq  'Microsoft Emulated IDE Controller') -and ($_.address -like $ControllerID)} |
                                           Add-Member -passthru -name "VMElementName" -MemberType noteproperty   -value $($vm.elementName) 
                 }
    }}
}