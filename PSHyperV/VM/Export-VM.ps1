$lstr_ExportOfVm  = "Export of {0} "
$lstr_ExportOfVmSuccess  = "Export of {0} to {1} completed."
$lstr_ExportVm    = "Export Virtual Machine"
$lstr_ExportOfVmFailure = "Attempt to export {0} to {1} failed. "
$lstr_ExportZip = "Zipping files for preservation"

Function Export-VM
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    Param (
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM , 
        
        [parameter(Mandatory = $true)]
        [string]$Path, 
        
        [ValidateNotNullOrEmpty()]
        $Server=".",         #May need to look for VM(s) on Multiple servers
        [switch]$CopyState,  
        [switch]$Wait, 
        [Switch]$Preserve, 
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM = (Get-VM -Name $VM -Server $server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | Foreach-Object  {export-vm  -VM $_ @PSBoundParameters}}        
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {  
            if ($force -or $psc.shouldProcess($vm.ElementName ,$lstr_ExportVm)) {  
                $VSMgtSvc=Get-WmiObject -ComputerName $VM.__server  -Namespace $HyperVNamespace  -Class "MsVM_virtualSystemManagementService"
                if ( ($VSMgtSvc.ExportVirtualSystem($VM.__path,($CopyState.Ispresent),$path)    | Test-wmiResult -wait:($wait -or $preserve) -JobWaitText ($lstr_ExportOfVm -f $vm.elementName)`
                            -SuccessText ($lstr_ExportOfVmSuccess -f $vm.elementName , $path) -failText ($lstr_ExportOfVmFailure -f $vm.elementName , $path) ) -eq [returnCode]::ok) {
                        if ($Preserve) {
                                   Write-Progress -activity ($lstr_ExportOfVm -f $vm.elementName) -Status $lstr_ExportZip
                                   Add-ZIPContent "$path\$($vm.elementname)\importFiles.zip" "$path\$($vm.elementname)\config.xml","$path\$($vm.elementname)\virtual machines"
                                   if (Get-ChildItem "$path\$($vm.elementname)\snapshots") {Add-ZIPContent "$path\$($vm.elementname)\importFiles.zip" "$path\$($vm.elementname)\snapshots"} 
                                   Write-Progress -activity ($lstr_ExportOfVm -f $vm.elementName) -Status $lstr_ExportZip -Completed
                       }
                } 
            }
         }
    }
}


