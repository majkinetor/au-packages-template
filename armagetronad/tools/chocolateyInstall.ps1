$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://sourceforge.net/projects/armagetronad/files/stable/0.2.9.0.1/armagetronad-0.2.9.0.1.gcc.win32.exe/download'

  softwareName  = 'Armagetron Advanced*'

  checksum      = 'bf27e9f2433f430b65590afda293666a6c95cf6bef063f5358faf6119dd635fd'
  checksumType  = 'sha256'

  silentArgs    = "/S"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
