$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$checksum     = 'd8467df18ed7d3b2e4e3520612f34de265b2b88e5f346cdebadccb0300100ad9'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'PingPlotter*'
  fileType      = 'exe'
  silentArgs    = "/quiet"
  
  validExitCodes= @(0)
  url           = "https://www.pingplotter.com/downloads/pingplotter_install.exe"
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
