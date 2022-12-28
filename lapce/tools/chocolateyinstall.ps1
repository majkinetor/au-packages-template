
$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  url64bit       = 'https://github.com/lapce/lapce/releases/download/v0.2.5/Lapce-windows.msi'
  checksum64     = '21E164D8F9BF829E1FE1A18DA26B24334232EB295905A98C50AD95DE3DD780DB'
  checksumType64 = 'sha256'

  softwareName   = 'lapce*'

  silentArgs     = "/quiet"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

















