

Function Select-VM
{# .ExternalHelp  MAML-VM.XML
    param ([ValidateNotNullOrEmpty()]
           $Server=".",
           [Switch]$Multiple
    )
    Get-VM -Server $Server | 
        Sort-Object -property elementName | 
            Select-list -Property @(@{Label="VM Name"; Expression={$_.ElementName}}, 
                                  @{Label="State"; Expression={[VMState]$_.EnabledState}}) -multiple:$multiple
}
