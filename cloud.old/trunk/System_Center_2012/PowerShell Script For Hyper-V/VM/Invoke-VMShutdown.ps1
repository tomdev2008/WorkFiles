
$lStr_VMShutdown                   = "Shutdown OS in the VM."
$lstr_VMShutdownItitiated          = "Shutdown of {0} has been initiated." 
$lstr_VMShutdownFailed             = "Could not begin Shutdown of {0}" 
$lstr_VMShutdownNoIC               = "Unable to get Shutdown Component for VM {0}.`nPlease verify that the Integration components are enabled for this VM." 
$Lstr_VMShutDownWaiting            = "Waiting for shudown to complete"

Function Invoke-VMShutdown
{# .ExternalHelp  MAML-VM.XML
   [CmdletBinding(SupportsShouldProcess=$True , ConfirmImpact='High' )]
    Param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [ValidateNotNullOrEmpty()]
        [string]$Reason = "Scripted",
        
        [ValidateNotNullOrEmpty()]
        $Server = ".",   #May need to look for VM(s) on Multiple servers

        [int]$ShutdownTimeOut , 
          
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) { $VM = Get-VM -Name $VM -Server $Server }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Invoke-VMShutdown -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem')     {
            $Endtime=(get-date).addSeconds($ShutdownTimeOut)
            $ShutdownComponent = Get-WmiObject -ComputerName $VM.__Server -Namespace $HyperVNamespace `
                                               -Query "SELECT * FROM MSVM_ShutdownComponent WHERE SystemName='$($VM.Name)'"
	        if ($ShutdownComponent -ne $null) {
	            if ($force -or $psc.shouldProcess($vm.elementName,$lStr_VMShutdown)) {  
	         	    $result = $ShutdownComponent.InitiateShutdown($true, $Reason)
		            if   ($result.ReturnValue -eq [ReturnCode]::OK) { 
                        write-verbose ($lstr_VMShutdownItitiated -f $VM.ElementName) 
                        Do { $vm.get()
                             $pending = ($vm.enabledState -ne [vmstate]::stopped -and ((get-date) -lt $endTime) )
                             if ($Pending) {write-progress -activity $Lstr_VMHeartBeatWaiting -Status $vm.elementname -Current ([vmState]$vm.enabledState)}
                             start-sleep 5
                           } while ($Pending )
                        write-progress -activity $Lstr_VMShutDownWaiting -Status $vm.elementname -Completed
                    }
        		    else {Write-error -message ($lstr_VMShutdownFailed -f $VM.ElementName) -Category InvalidResult -ErrorId $result.returnValue    }
                }
            }
	        else {Write-warning ($lstr_VMShutdownNoIC -f $vm.name)}
        }
    }
}
