####################################
#####     Helper functions     #####
####################################

Function Select-Item
{# .ExternalHelp  Maml-Helper.XML
   [CmdletBinding()]
   param ([parameter(ParameterSetName="p1",Position=0)][String[]]$TextChoices,
          [Parameter(ParameterSetName="p2",Position=0)][hashTable]$HashChoices, 
          [String]$Caption="Please make a selection",  [String]$Message="Choices are presented below",  [int]$default=0
    ) 
    $choicedesc = New-Object System.Collections.ObjectModel.Collection[System.Management.Automation.Host.ChoiceDescription] 
    switch ($PsCmdlet.ParameterSetName) { 
        "p1" {$TextChoices | ForEach-Object       { $choicedesc.Add((New-Object "System.Management.Automation.Host.ChoiceDescription" -ArgumentList $_                      )) }  } 
        "p2" {foreach ($key in $HashChoices.Keys) { $choicedesc.Add((New-Object "System.Management.Automation.Host.ChoiceDescription" -ArgumentList $key,$HashChoices[$key] )) }  }            
    }
    $Host.ui.PromptForChoice($caption, $message, $choicedesc, $default)
}


Function Select-List
{#  .ExternalHelp  Maml-Helper.XML
    Param   ([Parameter(Mandatory=$true  ,valueFromPipeline=$true )][Alias("items")]$InputObject, 
             [Parameter(Mandatory=$true)]$Property, [Switch]$multiple)
 
    begin   { $i= @()  }
    process { $i += $inputobject  }
    end     { if ($i.count -eq 1) {$i[0]} elseif ($i.count -gt 1) {
                  $Global:counter=-1
                  $Property=@(@{Label="ID"; Expression={ ($global:Counter++) }}) + $Property
                  format-table -inputObject $i -autosize -property $Property | out-host
                  if ($multiple) { $response = Read-Host "Which one(s) ?" }
                  else           { $Response = Read-Host "Which one ?" }
                  if ($response -gt "") { 
                       if ($multiple) { $Response.Split(",") | ForEach-Object -Begin {$r = @()} -process {if ($_ -match "^\d+$") {$r += $_} elseif ($_ -match "^\d+\.\.\d+$") {$r += (invoke-expression $_)}} -end {$I[$r] }}
                       else           { $I[$response] }
                  } 
              }
            }
}


Function Select-EnumType
{#  .ExternalHelp  Maml-Helper.XML
    param ([type]$EType , [int]$default) 
    $NamesAndValues= $etype.getfields() |
        foreach-object -begin {$list=@()} `
                       -process { if (-not $_.isspecialName) {$list += $_.getValue($null)}} `
                       -end {$list  | sort-object -property value__ } | 
            select-object -property  @{name="Name"; expression={$_.tostring() -replace "_"," "}},value__ 
    $value = (Select-List -Input $namesAndValues -property Name).value__
    if ($value -eq $null ) {$default} else {$value}
}


Function Out-Tree
{#  .ExternalHelp  Maml-Helper.XML
    Param ([Parameter(Mandatory=$true,ValueFromPipeLine = $true)][alias("items")]$inputObject, 
           [Parameter(Mandatory=$true)]$startAt, 
           [string]$path="Path", [string]$parent="Parent",[string]$label="Label", [int]$indent=0
          )
     begin   { 
         $items = @()
     }     
     process {     
         $items += $inputobject
     }
     end { 
         $children = $items | where-object {( "" + $_.$parent) -eq $startAt.$path.ToString()} 
         if ($children -ne $null) {(("| " * $indent) -replace "\s$","-") + "+$($startAt.$label)" 
                                   $children | ForEach-Object {Out-Tree -inputObject $items -startAt $_ -path $path -parent $parent -label $label -indent ($indent+1)}
         }
         else                     {("| " * ($indent-1)) + "|--$($startAt.$label)" }
     }     
}


Function Select-Tree
{#  .ExternalHelp  Maml-Helper.XML
    Param ([Parameter(Mandatory=$true,ValueFromPipeLine = $true)][alias("items")]$inputObject, 
           [Parameter(Mandatory=$true)]$startAt,  
           [string]$path="Path", [string]$parent="Parent", [string]$label="Label", $indent=0, 
           [Switch]$multiple
           )
     begin   { 
         $items = @()
     }     
     process {     
         $items += $inputobject
     }
     end { 
        if ($Indent -eq 0)  {$Global:treeCounter = -1 ;  $Global:treeList=@() ; $Leader="" }
        $Global:treeCounter++
        $Global:treeList=$global:treeList + @($startAt)
        $children = $items | where-object {$_.$parent -eq $startat.$path.ToString()} 
        if   ($children -eq $null) { "{0,-4} {1}|--{2} " -f  $global:Treecounter, ("| " * ($indent-1)) , $startAt.$Label | out-Host }
        else                       { "{0,-4} {1}+{2} "   -f  $Global:treeCounter, ("| " * ($indent)) ,   $startAt.$label | Out-Host
                                     $children | sort-object $label | ForEach-Object {
                                           Select-Tree -inputObject $items -StartAt $_ -Path $path -parent $parent -label $label -indent ($indent+1)
                                      }
        }
        if ($Indent -eq 0) {if ($multiple) { $Global:treeList[ [int[]](Read-Host "Which one(s) ?").Split(",")] }
                            else           { $Global:treeList[ (Read-Host "Which one ?")] }  
                           } 
  }                         
}


Function Test-Admin
{#  .ExternalHelp  Maml-Helper.XML
    [CmdletBinding()]
    Param() 
    
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $isAdmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    Write-Verbose "isUserAdmin? $isAdmin"
    $isAdmin
}


Function Convert-DiskIDtoDrive
{#  .ExternalHelp  Maml-Helper.XML
    param ([parameter(ParameterSetName="p1",Position=0, ValueFromPipeLine = $true)][ValidateScript({ $_ -ge 0 })][int]$diskIndex,
           [Parameter(ParameterSetName="p2",Position=0 , ValueFromPipeline=$true)] [System.Management.ManagementObject]$Inputobject
    ) 
    process{
        switch ($PsCmdlet.ParameterSetName) { 
            "p1"  { Get-WmiObject -query "select * from win32_diskpartition where diskindex = $DiskIndex" | ForEach-Object{$_.getRelated("win32_Logicaldisk")} | ForEach-Object {$_.deviceID} } 
            "p2"  { get-wmiobject  -computername $inputObject.__SERVER -namespace "root\cimv2"  -Query "associators of {$($inputObject.__path)} where resultclass=Win32_DiskPartition" | 
                    ForEach-Object{$_.getRelated("win32_Logicaldisk")} | ForEach-Object {$_.deviceID} 
                  }
                  
        }
    }     
}


Function Get-FirstAvailableDriveLetter
{#  .ExternalHelp  Maml-Helper.XML
    $UsedLetters = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk"  | ForEach-object {$_.deviceId.substring(0,1)} 
    [char]$l="A"
    do {
        if   ($usedLetters -notcontains $L) {return $l}
        else {  [char]$l=([byte][char]$l +1 ) }
       } 
    while ($l -le 'Z')
    write-warning "No free drive letters found"
}
