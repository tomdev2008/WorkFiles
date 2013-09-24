Function Get-ZIPContent 
{<#
    .SYNOPSIS
        Returns information about the contents of a zip file 
#>
    Param ([parameter(mandatory = $true)][ValidateNotNullOrEmpty()]
           [string]$zipFile, 
           [Switch]$Raw, 
           [int]$indent=0
    )
    if ($indent -eq 0) {
        if ($ZipFile -match ('zip$')) {$ZipFile += '.zip'} 
        $ZipFile = (resolve-path $ZipFile).path
    }
    $shell = new-object -com Shell.Application
    $NS    = $shell.NameSpace($zipFile)
    $Files = $(foreach ($item in $NS.items() ) {0..8 |
                   ForEach-Object -begin   {$ZipObj = New-Object -TypeName System.Object  } `
                                  -process {Add-Member -inputObject $ZipObj -MemberType NoteProperty -Name ($NS.GetDetailsOf($null,$_)) -Value ($NS.GetDetailsOf($Item,$_).replace([char]8206,"")) }  `
                                  -end     {if ($item.isfolder) {Add-Member -inputObject $ZipObj -MemberType NoteProperty -Name Formatting -value (("| " * $indent) + "+-")
                                                                 $ZipObj 
                                                                 Get-ZipContent -zipfile $item.path -raw -indent ($indent +1 ) }
                                            else                {Add-Member -inputObject $ZipObj -MemberType NoteProperty -Name Formatting -value (("| " * ($indent)) + "|-")
                                                                 if ($indent -eq 0) {$ZipObj.formatting = "|-" }
                                                                 $zipObj  
                                           }
                            }
             } ) 
    if ($raw) {$files} else {$files | format-Table  -property @{label="File"; expression={$_.Formatting + $_.Name}},Type,"Date Modified",Size,"Compressed Size",Ratio,Method -autosize}                                              
}