$ErrorActionPreference = 'Stop';

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://dl.dell.com/FOLDER05944445M/1/Dell-Command-Update_V104D_WIN_3.1.0_A00.EXE'
$checksum = 'ee1a19c642c16d8c1a5b13a674cab75a8b90dc004f055c6e45eabae20f64a95b'

 # the /factoryinstall parameter makes installer return success instead of '2' (which Chocolatey doesn't like)
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Dell Command | Update for Windows 10'
  fileType      = 'exe'
  silentArgs    = "/s /factoryinstall"
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 
