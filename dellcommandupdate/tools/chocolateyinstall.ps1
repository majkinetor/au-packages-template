$ErrorActionPreference = 'Stop';

$packageName  = 'dellcommandupdate'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.dell.com/FOLDER04139436M/1/Systems-Management_Application_FXD2R_WN32_2.3.0_A00-00.EXE'
$checksum = '6E6D1FFA16F97AC29FD8EB6D1676412954529376FCD8210AE655F5FECC6132F5'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'Dell Command | Update'
  fileType      = 'exe'
  silentArgs    = "/s"
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'md5'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 