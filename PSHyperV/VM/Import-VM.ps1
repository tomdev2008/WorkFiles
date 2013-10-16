$lstr_importFrom    = "Import VM from {0}"
$lstr_ImportSuccess = "Import VM completed." 

Function Import-VM
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    Param (
    
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName =$true,ValueFromPipeline =$true)][Alias("Fullname","Path","DiskPath")][ValidateNotNullOrEmpty()]
        [string[]]$Paths,
        
        [ValidateNotNullOrEmpty()]
        [String]$Server=".",   #Only import on one server 
        
        [switch]$ReimportVM, 
        [switch]$ReuseIDs,  
        [switch]$Wait, 
        [Switch]$Preserve,
        
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)  {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
        forEach ($Path in $Paths) {
            if ($server -eq ".") {$path = (Resolve-Path $path).path}
            if ($pscmdlet.shouldProcess(($lStr_ImportFrom -f $server))) {
                if ($Preserve) {Add-ZIPContent "$path\importFiles.zip" "$Path\config.xml","$path\virtual machines"
                                if (test-path "$path\$($vm.elementname)\snapshots") {Add-ZIPContent "$path\importFiles.zip" "$path\snapshots"}
                }  
                elseif ($reImportVM -and (test-path "$path\importFiles.zip")) {
                    Copy-ZipContent -Zipfile "$path\importFiles.zip" -path $path
                    remove-VM -VM $ReimportVM -Server $server -confirm
                }
                $VSMgtSvc=Get-WmiObject -ComputerName $server -Namespace $HyperVNamespace -Class "MsVM_virtualSystemManagementService"
                $Result=$VSMgtSvc.importVirtualSystem($path,(-not $ReuseIDs.Ispresent) )   
                If ($wait) {$job = test-wmijob $Result.Job  -wait -Description ($lstr_importFrom -f $path)
                           if ($job.jobState -eq 7) { Write-Verbose $lstr_ImportSuccess  }
                           else                     { Write-error   $Job.errorDescription }
                }           
                else       {Write-Verbose ([ReturnCode]$result.returnValue) 
                            $result.job 
                }
            }
        }
    } 
    
}


