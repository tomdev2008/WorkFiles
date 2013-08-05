$lstr_VMJPEGNoImage = "No image was returned. Try requesting a smaller size." 
$lstr_VMJPEGFailed = "The attempt to get the image failed"

Function Get-VMThumbnail
{# .ExternalHelp  MAML-VM.XML
    [CmdletBinding()]
    param(
        [parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $VM, 
        
        [ValidateNotNullOrEmpty()]
        [int]$Width = 800, 
        
        [ValidateNotNullOrEmpty()]
        [int]$Height = 600,
        
        [string]$Path,

        [switch]$Passthru,
        
        [ValidateNotNullOrEmpty()]
        $Server = "."   #May need to look for VM(s) on Multiple servers
    )
    Process {
        if ($VM -is [String]) {$VM=(Get-VM -Name $VM -Server $Server) }
        if ($VM.count -gt 1 ) {[Void]$PSBoundParameters.Remove("VM") ;  $VM | ForEach-object {Get-VMThumbnail -VM $_ @PSBoundParameters}}
        if ($vm.__CLASS -eq 'Msvm_ComputerSystem') {
            $VMSettings = Get-VMSettingData -vm $VM 
            if ($VMSettings -is [System.Management.ManagementObject])  {
                [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") | out-null
                $VSMgtSvc = Get-WmiObject -ComputerName $VM.__Server -Namespace $HyperVNamespace -Class $VirtualSystemManagementServiceName
                $result = $VSMgtSvc.GetVirtualSystemThumbnailImage( $VMSettings , $Width, $Height)    
                # MSDN implies that GetVirtualSystemThumbnailImaage is always synchronous so only test for OK, not for "background job started" 
                if ($result.returnValue -eq [ReturnCode]::OK)    {
                    if ($Result.ImageData -ne $null)     {    # Create a bitmap of the requested size in 16BPP format
                        $VMThumbnail = new-object System.Drawing.Bitmap($Width, $Height, [System.Drawing.Imaging.PixelFormat]::Format16bppRgb565)
                        # Lock the System.Drawing.Bitmap into system memory (the rectangle is a structure specifying the portion to lock.)
                        $rectangle = new-object System.Drawing.Rectangle(0, 0, $Width, $Height)
                        $VMThumbnailBitmapData = $VMThumbnail.LockBits($rectangle, 
                                                                       [System.Drawing.Imaging.ImageLockMode]::WriteOnly, 
                                                                       [System.Drawing.Imaging.PixelFormat]::Format16bppRgb565
                                                                      )
                        # Since GetVirtualSystemThumbnailImage returns a byte[], we need to copy the bytes into the Bitmap object 
	    	            [System.Runtime.InteropServices.Marshal]::Copy($Result.ImageData,  0, $VMThumbnailBitmapData.Scan0, ($Width * $Height * 2))
                        # Now unlock it 
                        $VMThumbnail.UnlockBits($VMThumbnailBitmapData)
                   
                        # did user ask to save the thumbnail a file ?
                        if ($passthru)  { $VMThumbnail }
                        else {
                             $PNGPath = $path	
                             #if No path at all is provided, make the path the current directory
                             if ($PNGPath -eq "") {$PNGPath = $pwd}
                             #if the path is a directory add VMName.PNG to the end of it.
                             if (test-path $PNGPath -pathtype container) {$PNGPath = join-Path $PNGPath ($VMSettings.elementName + ".PNG") }
                             #if the path starts with ".\" add the current directory to the begining of it 
                             if ($PNGPath.StartsWith(".\")) {PNGPath= join-path $PWD PNGPath.Substring(2)  }
                             #If all we have is a file name add the current directory to the start of it 
                             $Folder = split-path $PNGPath
                             if ($folder -eq "" ) {$PNGPath  = join-Path $pwd $PNGPath }
                             # Allow for the folder being a relative path, and make it an absolute path 
                             else  {$PNGpath=$PNGpath.Replace($Folder , (resolve-path $folder)) }
                             #Allow for .PNG being omitted from the file name. 
                             if (-not $PNGpath.toUpper().endswith("PNG")) {$PNGPath = $PNGPath + ".PNG"}
                             # ...and save
                             $VMThumbnail.Save($PNGPath)
                        }
                   }
                }
	        else  { write-warning $lstr_VMJPEGNoImage }  
            }
        }
    }
}
