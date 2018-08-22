$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.dell.com/FOLDER04998665M/3/Dell-Command-Update_4374J_WIN_3.0.0_A00.EXE'
$checksum = '026EF6820AFE8E26F8A928A5DBB83274'

 # the /factoryinstall parameter makes installer return success instead of '2' (which Chocolatey doesn't like)
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Dell Command | Update for Windows 10'
  fileType      = 'exe'
  silentArgs    = "/s /factoryinstall"
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'md5'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 
