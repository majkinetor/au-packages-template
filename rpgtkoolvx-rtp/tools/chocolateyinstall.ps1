
$ErrorActionPreference = 'Stop';


$packageName= 'rpgtkoolace-rtp'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://tkool.jp//assets/files/vx_rtp202.zip'

$unzipArgs = @{
  url           = $url
  packageName   = $packageName
  checksum      = 'ac668cd1ea09abd6fcd66fc67f8203a2ae8a0c4e696389241549973dcdde42d0'
  checksumType  = 'sha256'
  unzipLocation = $toolsDir

}
Install-ChocolateyZipPackage @unzipArgs

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file         = Join-Path ((Get-ChildItem $toolsDir -Directory ).FullName) "Setup.exe"

  softwareName  = 'RPG Tkool VX *'


  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs


















