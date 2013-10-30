$LHash_PingStatusCode = @{0     = "Success"                          ; 11001 = "Buffer Too Small" ; 
                         11002 = "Destination Net Unreachable"      ; 11003 = "Destination Host Unreachable" ;
                         11004 = "Destination Protocol Unreachable" ; 11005 = "Destination Port Unreachable" ;
                         11006 = "No Resources"                     ; 11007 = "Bad Option" ; 
                         11008 = "Hardware Error"                   ; 11009 = "Packet Too Big" ; 
                         11010 = "Request Timed Out"                ; 11011 = "Bad Request"; 
                         11012 = "Bad Route"                        ; 11013 = "TimeToLive Expired Transit"; 
                         11014 = "TimeToLive Expired Reassembly"    ; 11015 = "Parameter Problem";
                         11016 = "Source Quench"                    ; 11017 = "Option Too Big" ;
                         11018 = "Bad Destination"                  ; 11032=  "Negotiating IPSEC"; 
                         11050="General Failure" } #End PingStatusCode

$lstr_NoFQDN          = "Could not discover VM's FQDN"
$lstr_FQDNNotResolved = "Address not resolved"

Function Ping-VM
{# .ExternalHelp  MAML-VM.XML
    Param(
    [parameter(Mandatory = $true, ValueFromPipeline = $true)] 
    $VM , 
    
    [ValidateNotNullOrEmpty()]
    $Server=".",   #May need to look for VM(s) on Multiple servers
    
    [Switch]$UseIP4Address,
    [Switch]$UseIP6Address
    ) 
    
    Process {
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 )  {$VM | foreach-Object {Ping-VM $_ -Server $Server} }
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') { 
            if ($VM.EnabledState -ne $vmstate["running"]) {
                $vm | Select-object -property @{Name="VMName"; expression={$_.ElementName}}, 
                                              @{Name="FullyQualifiedDomainName"; expression={$null}} , 
                                              @{name="NetworkAddress"; expression={$null}} ,
                                              @{Name="Status"; expression={"VM {0}" -f [vmstate]$_.EnabledState } }
            }            
            else {
                $vmkvp =(Get-VMKVP $VM)
                $query = $null 
                if     ($UseIP6Address -and $vmkvp.NetworkAddressIPv6)      {$query=($vmkvp.NetworkAddressIPv6 -split "%")[0]  + "'"}
                Elseif ($UseIP4Address -and $vmkvp.NetworkAddressIPv4)      {$query= $vmkvp.NetworkAddressIPv4       +           "' and recordRoute=1"}
                elseif (                    $vmKvp.fullyQualifiedDomainName){$query= $vmKvp.fullyQualifiedDomainName +           "' and recordRoute=1 and ResolveAddressNames = True"}
                if ($query -eq $null) {
                    $vm | Select-object -property @{Name="VMName"; expression={$vm.ElementName}},
                                                  @{Name="FullyQualifiedDomainName"; expression={$null}} , 
                                                  @{name="NetworkAddress"; expression={$null}} ,
                                                  @{Name="Status"; expression={$lstr_NoFQDN }} 
                }           
                else {
                 write-debug "will attempt to WMI PING  where Address='$query"
                       Get-WmiObject -Namespace "root/cimV2" -query ("Select * from  Win32_PingStatus where Address='" + $query)  |
                       Select-object -property @{Name="VMElementName"; expression={$vm.ElementName}},
                                               @{Name="FullyQualifiedDomainName"; expression={$vmKvp.fullyQualifiedDomainName}} , 
                                               @{name="NetworkAddress"; expression={$_.ProtocolAddress}} , ResponseTime , TimeToLive , StatusCode , 
                                               @{Name="Status"; expression={if  ($_.PrimaryAddressResolutionStatus -eq 0) { $LHash_PingStatusCode[[int]$_.statusCode]} 
                                                                            else {  $lstr_FQDNNotResolved }}}
               }
            }
        }
    }    
}
