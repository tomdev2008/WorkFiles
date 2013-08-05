$Lstr_VHDCreationSuccess              = "VHD {0} created succesfully."
$Lstr_VHDCreationFailure              = "The attempt to Create VHD {0} failed with response "
$lstr_VHDCreate                       =  "Create VHD " 
$lstr_VHDBadParent                    = "The parent path provided for the differencing disk is not valid."


Function New-VHD
{# .ExternalHelp  MAML-VMDisk.XML
    [CmdletBinding(SupportsShouldProcess=$True)]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)][Alias("Path","FullName")][ValidateNotNullOrEmpty()]
        $VHDPaths,              # May create multiple VHDs at once. 
        
        [ValidateRange(1GB,2040GB)]
        [long]$Size = 127GB,

        [Alias("ParentDiskPath","ParentPath")]
        $ParentVHDPath,
        
        [ValidateNotNullOrEmpty()] 
        [string]$Server = ".",  #Only work with images on one server  
        [switch]$Fixed,
        [switch]$Wait,
        $PSC, 
        [switch]$Force
    )
    process {
        if ($psc -eq $null)       {$psc = $pscmdlet} ; if (-not $PSBoundParameters.psc) {$PSBoundParameters.add("psc",$psc)}
         write-debug "Before Resolution VHDPaths = $VHDPaths"
        #Slightly odd syntax in the next line to cope with file names being passed instead of paths and not throwing an error
        # Line is only there in the first place to resolve incomplete / implied paths e.g. .\tenby.vhd and wildcards
        if (($Server -eq ".") -and ((test-path $vhdpaths) -contains $true))  {$VHDPaths = (Resolve-Path -path $VHDPaths -errorAction "SilentlyContinue" | ForEach-Object {$_.path}) }
        Foreach ($vhdPath in $vhdPaths) {
            if ($VHDPath -notmatch "(\w:|\w)\\\w") {$VHDPath    = (Get-VhdDefaultPath $Server) +'\' + $VHDPath  }
            if ($vhdpath -notmatch "VHD$" )        {$vhdPath   += ".VHD"}
            write-debug "After Resolution VHDPath = $VHDPath"           
            if (($VHDPath)  -and ($force -or $psc.shouldProcess($VHDPath,$lstr_VHDCreate)))  {
                $ImageManagementService = Get-WmiObject -ComputerName $Server -Namespace $HyperVNamespace -Class $ImageManagementServiceName
                if ($ParentVHDPath )  {
                    write-debug "before resolution parent VHD path = $parentVHDPath"
                    if ($ParentVHDPath -is [scriptblock])     {$PVHD  = Invoke-Expression ".{$ParentVHDPath}"  } 
                    else                                      {$PVHD  = $ParentVHDPath }
                    if ( $ParentVHDPath -isNot [String])      {$PVHD  = $PVHD.ToString() }
                    if (($PVHD -split "\\").count -le 1)      {$PVHD  = (Get-VhdDefaultPath $Server) +'\' +  $PVHD }
                    if ( $PVHD -notmatch ".VHD$" )            {$PVHD += ".VHD"}
                    if ( $server -eq ".")                     {$PVHD  = (Resolve-Path -Path $PVHD -ErrorAction SilentlyContinue).path }         
                    write-debug "After resolution Parent VHD path = $PVHD"
                    if ( $PVHD)  {$result = $ImageManagementService.CreateDifferencingVirtualHardDisk($VHDPath, $PVHD)}
                    else         {write-warning $lstr_VHDBadParent; Return $null }
                }
                elseif($Fixed) { $result = $ImageManagementService.CreateFixedVirtualHardDisk(  $VHDPath, $Size) }
                else           { $result = $ImageManagementService.CreateDynamicVirtualHardDisk($VHDPath, $Size) }
                if ((Test-wmiResult -result $result -wait:$wait -JobWaitText ($lstr_VHDCreate + $vhdPath)`
                                -SuccessText ($Lstr_VHDCreationSuccess -f $vhdPath) -failText ($Lstr_VHDCreationFailure -f $vhdPath) ) -eq [returnCode]::ok) { Get-vhdInfo -server $server $vhdpath } 
            }
        }
    }      
}