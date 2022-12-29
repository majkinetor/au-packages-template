
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/lapce/lapce/releases/download/v0.2.5/Lapce-windows.msi'
  checksum64     = '21e164d8f9bf829e1fe1a18da26b24334232eb295905a98c50ad95de3dd780db'
  checksumType64 = 'sha256'

  softwareName   = 'lapce*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















