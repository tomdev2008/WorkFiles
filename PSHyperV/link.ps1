function link  {
param ([parameter(ValueFromPipeLine = $true,ValueFromPipeLineByPropertyName = $true)]
        [string]$name , [Switch]$Full, [switch]$noedit)
process {
    if ($full) {dir "$name\*.ps1" | get-content | where {$_ -match '^\$lst'} | %{if ($_ -match "@{") {$_ } else {$halves = $_.split("="); ("{0,-38}={1}" -f $halves[0],$halves[1])}} |  sort  -Unique | Set-Content -Encoding ASCII -Path "$name.ps1"}
    else       {del "$name.ps1"}
    dir "$name\*.ps1" | get-content | where {$_ -notmatch '^\$lst'} | where {$_ -notmatch '^Set-Alias'}  | Add-Content -Encoding ASCII -Path "$name.ps1"
    if ($full) {dir "$name\*.ps1" | get-content | where {$_ -match '^Set-Alias'}  | Add-Content -Encoding ASCII -Path "$name.ps1" }
    if (-not $noEdit) {edit ".\$name.ps1"}
 }
}