$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'PingPlotter*'
  fileType      = 'exe'
  silentArgs    = "/quiet"
  
  validExitCodes= @(0)
  url           = "https://www.pingplotter.com/downloads/pingplotter_install.exe"
  checksum      = '1AF832DA9EE765E78E7C2EAACFB758111B946CEF12D7134C1605552E38C7684B'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs