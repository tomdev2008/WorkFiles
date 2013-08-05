

Function Select-VMSwitch
{# .ExternalHelp  MAML-VMNetwork.XML
    Param (
           [ValidateNotNullOrEmpty()] 
           [string]$Server = "."  #Only Makes sense to select from one server
          )
    Get-Vmswitch -server $server | Select-list -property @{Label="Switch Name"; Expression={$_.ElementName}}
}