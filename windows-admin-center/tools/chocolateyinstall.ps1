$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter2007.msi'
$checksum = '984321E591A37540E12EC2975241174B84BF1C8119802D1F0F643F9743C6B097'

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
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
