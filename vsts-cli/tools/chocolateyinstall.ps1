$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Microsoft VSTS CLI*'
  fileType      = 'msi'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  url           = "https://vstscli.blob.core.windows.net/msi/vsts-cli-0.1.0b1.msi"
  checksum      = '3A02FCDDF358E19757FB02FE211D00A5F60C771638A288EB2E8ADF1D432E52B7'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 