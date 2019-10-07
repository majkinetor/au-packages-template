$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.8.1.b246/mirthconnect-3.8.1.b246-windows.exe'
$url64      = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.8.1.b246/mirthconnect-3.8.1.b246-windows-x64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Mirth Connect *'

  checksum      = '826d8b4aba07f2f0aa9735ac3f765e6a0ea8288635cee07ba07952aee8d6db4e'
  checksumType  = 'sha256'
  checksum64    = '0e1158c5dfcaad5dbd8d8fc3d1b78e20a9404e06e0197f93583d6590651da132'
  checksumType64= 'sha256'

  # OTHERS
  silentArgs   = "-q -console -varfile $($toolsDir)\response.varfile"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
