$lstr_NewSnapShotSuccess   = "Successfully Created a new snapshot of VM {0}"
$lstr_NewSnapShotFailure   = "The attempt to snapshot VM {0} failed with the result "
$lstr_NewSnapShot          = "Create Snapshot "


Function New-VMSnapshot
{# .ExternalHelp  MAML-VMSnapshot.XML
    [CmdletBinding(SupportsShouldProcess=$true  , ConfirmImpact='High' )]
    Param( 
           [parameter(Position=0 , Mandatory = $true, ValueFromPipeline = $true)]
           $VM , 
           [string]$Note, 

           [ValidateNotNullOrEmpty()] 
           $Server=".", 
           
           [switch]$Wait,
           $PSC,
           [Switch]$Force)
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object { New-VMsnapshot -VM $_  @PSBoundParameters}} 
        if (($vm.__CLASS -eq 'Msvm_ComputerSystem') -and ($force -or $psc.shouldProcess($VM.elementName , $lstr_NewSnapShot))) {
            $VSMgtSvc=Get-WmiObject -ComputerName $VM.__server -NameSpace  $HypervNameSpace -Class "MsVM_virtualSystemManagementService"
            $WMIResult = $VSMgtSvc.CreateVirtualSystemSnapshot($vm) 
            if ((Test-wmiResult -result $WMIResult -wait:$wait -JobWaitText ($lstr_NewSnapShot + $VM.elementName)`
                                -SuccessText ($lstr_NewSnapShotSuccess -f $VM.elementName) `
                                -failText    ($lstr_NewSnapShotFailure -f $VM.elementName)) -eq [ReturnCode]::OK) {
                $Snap = ([wmi]$WMIResult.Job).getRelated("Msvm_VirtualSystemSettingData")
                if ($note) {$Snap | foreach-object {set-vm -VM $_ -note $note -psc $psc -Force:$true  ; $_.get() ; $_ }}
                else       {$Snap | foreach-object {$_} } 
            }
        }
    }   
} 