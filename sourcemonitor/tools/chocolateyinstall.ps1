$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'sourcemonitor*'
  fileType      = 'exe'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  
  validExitCodes= @(0)
  url           = "http://www.campwoodsw.com/SMSetupV353.exe"
  checksum      = '2A0566C9D853EA312A208DD56FA0E51B77385379C7433C722CD32BD0E8FCBE48'
  checksumType  = 'sha256'
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 