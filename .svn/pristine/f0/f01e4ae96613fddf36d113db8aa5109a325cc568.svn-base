$lstr_DirectoryNotFound = "The specified directory does not exist"

Function Get-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    Param (
        [parameter(ValueFromPipelineByPropertyName  = $true, ValueFromPipeline  = $true)]
        [ValidateNotNullOrEmpty()][Alias("Fullname","VHDPath","DiskPath")]
        [String[]]$Paths ,       
        
        [ValidateNotNullOrEmpty()] 
        [String]$Server="."          #only get images from a single server   
    )
    process {
        ForEach ($path in $paths)  {
            if (-not $path) {$path = (Get-VhdDefaultPath -server $server)}
            $Path = $path -replace "\\$",""
            $d = get-wmiobject -ComputerName $server -query ("select * from Win32_Directory where name='{0}'" -f $path.replace('\','\\') )
            if ($d) {$d.getrelated("cim_datafile")  | where-object {$_.extension -eq "VHD"} | Add-Member -MemberType ALIASPROPERTY -Name "fullname" -Value "Name" -PassThru |
                                                      Add-Member -MemberType ALIASPROPERTY -Name "Size" -Value "FileSize" -PassThru |sort-object -Property name }   
            else    { write-warning $lstr_DirectoryNotFound }
        }
    }
}
