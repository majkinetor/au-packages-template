$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$checksum     = '59932b57d9b023bcedffa85bcf9c72e08c001e02eff0a8e8d333b76044a314e2'

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
