$LHash_suites=@{1="Small Business";2="Enterprise";4="BackOffice";8="Communications";16="Terminal";32="Small Business Restricted";64="Embedded NT";128="Data Center";256="Single User";512="Personal";1024="Blade"}

Function Get-VMKVP
{# .ExternalHelp  MAML-VMConfig.XML
    param(
        [parameter(ValueFromPipeline = $true)]
        $VM="%",
        
        [ValidateNotNullOrEmpty()] 
        $Server = "."  #May need to look for VM(s) on Multiple servers
    )
    Process {
         if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
         if ($VM.count -gt 1 ) {$VM | foreach-Object {get-VMKVP -VM $_ -Server $Server} }
         if ($vm.__CLASS -eq 'Msvm_ComputerSystem') { 
             $KVPComponent=(Get-WmiObject -computername $VM.__Server -Namespace $HyperVNamespace -query "select * from Msvm_KvpExchangeComponent where systemName = '$($vm.name)'")
             if ($KVPComponent.GuestIntrinsicExchangeItems  ) {
                 ($KVPComponent.GuestIntrinsicExchangeItems + $KVPComponent.GuestExchangeItems ) | forEach-object `
                     -begin {$KVPObj = New-Object -TypeName System.Object 
                             Add-Member -inputObject $KvpObj -MemberType NoteProperty -Name "VMElementName" -Value $vm.elementName
                     } `
                     -process {([xml]$_).SelectNodes("/INSTANCE/PROPERTY") | ForEach-Object -process {if ($_.name -eq "Name") {$propName=$_.value}; if  ($_.name -eq "Data") {$Propdata=$_.value} } `
                                                                                            -end     {Add-Member -inputObject $KvpObj -MemberType NoteProperty -Name $PropName -Value $PropData}
                     }  `
                     -end {[string[]]$Descriptions=@()
                           if ($KvpObj.ProcessorArchitecture -eq 0)  {$descriptions += "x86" }
                           if ($KvpObj.ProcessorArchitecture -eq 9)  {$descriptions += "x64" }
                           if ($KvpObj.ProductType -eq 1 )           {$descriptions += "Workstation" }
                           if ($KvpObj.ProductType -eq 2 )           {$descriptions += "Domain Controller" }
                           if ($KvpObj.ProductType -eq 3 )           {$descriptions += "Server" } 
                           foreach  ($Key in $LHash_suites.keys) {
                                  if ($KvpObj.suiteMask -band $key)  {$descriptions += $suites.$key}
                           }
                           Add-Member -inputObject $KvpObj -MemberType NoteProperty -Name "Descriptions"  -Value $descriptions
                           $KvpObj
                     } 
             }
         }
    }
}

