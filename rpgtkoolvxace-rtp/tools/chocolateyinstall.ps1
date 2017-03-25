
$ErrorActionPreference = 'Stop';


$packageName= 'rpgtkoolace-rtp'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://tkool.jp//assets/files/vxace_rtp100.zip'

$unzipArgs = @{
  url           = $url
  packageName   = $packageName
  checksum      = 'b3dad56dc143ed3ccd911f73a706a5707484e70c89dca67a55a70c3fabe00730'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir

}
Install-ChocolateyZipPackage @unzipArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file         = Join-Path ((Get-ChildItem $toolsDir -Directory ).FullName) "Setup.exe"

  softwareName  = 'RPG Tkool VX Ace *'


  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs


















