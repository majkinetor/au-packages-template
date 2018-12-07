$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'sourcemonitor*'
  fileType      = 'exe'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  
  validExitCodes= @(0)
  url           = "http://www.campwoodsw.com/SMSetupV356.exe"
  checksum      = '623ADBF512BBC0F4E01F2D87E7DE4115192721C15039026192F1915BC7627840'
  checksumType  = 'sha256'
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 