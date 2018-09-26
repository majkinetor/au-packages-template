$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://sourceforge.net/projects/armagetronad/files/stable/0.2.8.3.4/armagetronad-0.2.8.3.4.gcc.win32.exe/download'

  softwareName  = 'Armagetron Advanced*'

  checksum      = '5279281ab664f4a17dd7a1842c29da210d0026ab9ee5300bd714fe14c8356d15'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
