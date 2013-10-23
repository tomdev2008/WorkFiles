$uname="kxcomm\administrator"
$pwd=ConvertTo-SecureString  "Root-admin" -AsPlainText -Force;
$cred =New-Object System.Management.Automation.PSCredential($uname,$pwd);

$outputs = Invoke-Command -ComputerName 192.168.7.50 -ScriptBlock { 
Set-ExecutionPolicy Unrestricted;
Import-Module -Name virtualmachinemanager ¨CGlobal;
Get-SCVirtualMachine -all;
} -Credential $cred

#echo $outputs | Format-List -property Name, Owner, Description, HostName, OperatingSystem, CPUCount, Memory,AddedTime,Modifiedtime,TotalSize,Status,Location;
echo $outputs | Export-Csv "E:\\powerShell\\result\\"