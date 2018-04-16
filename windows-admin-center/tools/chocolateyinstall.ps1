$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters

# Defaults
$port = 6516
$certificateOption = "generate"
$thumbprint = ""

if ($pp['PORT']) {
  $port = [int] $pp['PORT']
}

if ($pp['THUMBPRINT']) {
  $certificateOption = "installed"
  $thumbprint = "SME_THUMBPRINT=$($pp['THUMBPRINT'])"
}

# http://aka.ms/WACDownload
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Windows Admin Center'
  fileType      = 'msi'
  silentArgs    = "/qn /norestart SME_PORT=$port SSL_CERTIFICATE_OPTION=$certificateOption $thumbprint /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
  url           = "https://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter1804.msi"
  checksum      = 'B07B3A0BD45B34E695205DDD4B9BC07C23F65D948AE729A279424186989F54D3'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs