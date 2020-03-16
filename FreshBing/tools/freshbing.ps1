# FreshBing. Original version from https://github.com/ndabas/FreshBing
# Updated by David Gardiner to add image detail text

$rssUrl = "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-AU" 

$runFile = Join-Path (Split-Path $MyInvocation.MyCommand.Path) "LastRun.xml"

[System.Net.WebClient] $wc = New-Object System.Net.WebClient
$wc.Encoding = [System.Text.Encoding]::UTF8
 
$feed = [xml]$wc.DownloadString($rssUrl)
$base = [Environment]::GetFolderPath("MyPictures")
$selectedUrl = ""
$selectedFile = $base + "\background.jpg"

if (!$feed) {
    Write-Error "Feed download failed - try again later."
    Return
}


$selectedUrl = "http://www.bing.com" + $feed.images.image.url

$selectedUrl = $selectedUrl.Substring(0, $selectedUrl.LastIndexOf("_"))

$selectedUrl += "_1920x1080.jpg"

Write-Host "Downloading $selectedUrl -> $selectedFile"
(New-Object System.Net.WebClient).DownloadFile($selectedUrl, $selectedFile)

if (!(Test-Path $selectedFile)) {
    Write-Error "Download failed - try again later."
    Return
}

Add-Type -Namespace FreshBing -Name UnsafeNativeMethods -MemberDefinition @"
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
public static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
"@
$SPI_SETDESKWALLPAPER = 20
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDWININICHANGE = 0x02

[Reflection.Assembly]::LoadWithPartialName("System.Drawing") | Out-Null
    
[Drawing.Image] $image = [Drawing.Image]::FromFile($selectedFile)
[Drawing.Graphics] $g = [System.Drawing.Graphics]::FromImage($image)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$font = [Drawing.Font]::new("Arial", 9)

# http://stackoverflow.com/a/1192560/25702
$g.DrawString($feed.images.image.copyright, $font, [System.Drawing.Brushes]::Black, [Drawing.PointF]::new(0, $image.Height - 16))
$g.DrawString($feed.images.image.copyright, $font, [System.Drawing.Brushes]::Black, [Drawing.PointF]::new(2, $image.Height - 16))
$g.DrawString($feed.images.image.copyright, $font, [System.Drawing.Brushes]::Black, [Drawing.PointF]::new(1, $image.Height - 16 - 1))
$g.DrawString($feed.images.image.copyright, $font, [System.Drawing.Brushes]::Black, [Drawing.PointF]::new(1, $image.Height - 16 + 1))

$g.DrawString($feed.images.image.copyright, $font, [System.Drawing.Brushes]::White, [Drawing.PointF]::new(1, $image.Height - 16))

$font.Dispose()

$bmpFile = [System.IO.Path]::ChangeExtension($selectedFile, ".bmp")
$image.Save($bmpFile) #, "Bmp")
$g.Dispose()
$image.Dispose()
    
[FreshBing.UnsafeNativeMethods]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $bmpFile, $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE)

Set-ItemProperty -path "HKCU:\Control Panel\Desktop\" -name WallpaperStyle -value 2
Set-ItemProperty -path "HKCU:\Control Panel\Desktop\" -name TileWallpaper -value 0

# Save this run time
Get-Date | Export-Clixml $runFile

exit 0