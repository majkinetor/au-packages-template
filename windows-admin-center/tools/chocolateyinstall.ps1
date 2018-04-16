$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# http://aka.ms/WACDownload
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Windows Admin Center'
  fileType      = 'msi'
  silentArgs    = "/qn /norestart SME_PORT=6516 SSL_CERTIFICATE_OPTION=generate /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  url           = "http://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter1804.msi"
  checksum      = 'B07B3A0BD45B34E695205DDD4B9BC07C23F65D948AE729A279424186989F54D3'
  checksumType  = 'sha256'
  url64bit      = ""   # 64bit URL here (HTTPS preferred) or remove - if installer contains both architectures (very rare), use $url
  checksum64    = ''
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs