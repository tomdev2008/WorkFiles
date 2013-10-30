$lStr_GetSummaryInfoError = "Get Summary info error : {0}"


Function Get-VMSummary
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
           [parameter(ValueFromPipeline = $true)]
           $VM="%" ,
           
           [ValidateNotNullOrEmpty()]
           $Server="."   #May need to look for VM(s) on Multiple servers
         )         
    Process {
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VMSummary -VM $_  @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') { 
            $VSMgtSvc=Get-WmiObject -computerName $Vm.__Server -NameSpace $HyperVNamespace  -Class "MsVM_virtualSystemManagementService" 
            $result=$VSMgtSvc.GetSummaryInformation( @( (Get-VMSettingData $vm ).__Path ) ,  @(0,1,2,3,4,100,101,102,103,104,105,106,107,108))
            if ($Result.ReturnValue -eq 0) {$result.SummaryInformation | foreach-object {
                 New-Object PSObject -Property @{      
                   "Host"             =  $VM.__server                   ;  "VMElementName"    =  $_.elementname
                   "Name"             =  $_.name                        ;  "CreationTime"     =  $_.CreationTime
                   "EnabledState"     =  ([vmstate]($_.EnabledState))   ;  "Notes"            =  $_.Notes
                   "CPUCount"         =  $_.NumberOfProcessors          ;  "CPULoad"          =  $_.ProcessorLoad
                   "CPULoadHistory"   =  $_.ProcessorLoadHistory        ;  "MemoryUsage"      =  $_.MemoryUsage
                   "GuestOS"          =  $_.GuestOperatingSystem        ;  "Snapshots"        =  $_.Snapshots.count
                   "Jobs"             =  $_.AsynchronousTasks           ;  "Uptime"           =  $_.UpTime
                   "UptimeFormatted"  =  $(if ($_.uptime -gt 0) {([datetime]0).addmilliseconds($_.UpTime).tostring("hh:mm:ss")} else {0} )
                   "Heartbeat"        =  $(if ($_.heartBeat) { [HeartBeatICStatus] $_.Heartbeat} else {$null} )
                   "FQDN"             =  ((get-vmkvp -vm $vm).FullyQualifiedDomainName)
        	       "IpAddress"        =  ((Ping-VM $vm).NetworkAddress)}
            }}
            else  {write-Warning ($lStr_GetSummaryInfo  -f [ReturnCode]$result.returnValue )}
        }
    }
}
