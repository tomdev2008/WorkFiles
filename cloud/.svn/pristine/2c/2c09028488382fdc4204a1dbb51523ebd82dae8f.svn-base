$lStr_VMConnectInvalidSystem = "Can not run VMConnect is on this system. Skipping."

Function New-VMConnectSession
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding()]
    Param([parameter(Mandatory = $true, ValueFromPipeline = $true)][ValidateNotNullOrEmpty()]
           $VM,        
          
           [parameter()][ValidateNotNullOrEmpty()] 
           $Server = "."   #May need to look for VM(s) on Multiple servers
          )
    process {
        # Check Windows edition, and look for the EXE before we run it...
        if (Test-Path env:PROCESSOR_ARCHITEW6432 ) {$vmConnectPath = (join-path $Env:ProgramW6432 "Hyper-V\VMconnect.exe")}
        else                                       {$vmConnectPath = (join-path $Env:ProgramFiles "Hyper-V\VMconnect.exe")}
        if ( ((Get-Itemproperty -path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion").editionID -notmatch "core|hyper") -and  	    
             (Test-Path $vmConnectPath))   { 
            if ($VM -is [String]) { $VM = Get-VM -Name $VM -Server $Server }
            if ($VM.count -gt 1 )  { $VM | Foreach-object {New-VMConnectSession -VM $_ -Server $Server}  }
            
            if ($vm.__CLASS -eq 'Msvm_ComputerSystem') { (Start-Process -PassThru -FilePath $vmConnectPath -ArgumentList "$($Vm.__Server) -G $($VM.Name)").Id }
        }
        Else { Write-Error -message $lStr_VMConnectInvalidSystem -Category invalidoperation }
    }
}