$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = ''

#Based on MSI
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'vsts-cli*'
  fileType      = 'msi'
  silentArgs    = "/s"
  validExitCodes= @(0, 3010, 1641)
  url           = "https://vstscli.blob.core.windows.net/msi/vsts-cli-0.1.0b1.msi"  #download URL, HTTPS preferrred
  checksum      = '3A02FCDDF358E19757FB02FE211D00A5F60C771638A288EB2E8ADF1D432E52B7'
  checksumType  = 'sha256'
  url64bit      = ""   # 64bit URL here (HTTPS preferred) or remove - if installer contains both architectures (very rare), use $url
  checksum64    = ''
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 

## See https://chocolatey.org/docs/helpers-reference

