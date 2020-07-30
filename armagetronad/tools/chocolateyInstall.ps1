$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://sourceforge.net/projects/armagetronad/files/stable/0.2.9.0/armagetronad-0.2.9.0.gcc.win32.exe/download'

  softwareName  = 'Armagetron Advanced*'

  checksum      = '7fe67585fffb4fe110e43888852ef8d832ee5474f105271b2dc99a2cb875e050'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
