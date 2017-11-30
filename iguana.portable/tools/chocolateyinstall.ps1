$ErrorActionPreference = 'Stop';

$packageName= 'iguana.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/6_0_7/iguana_noinstaller_6_0_7_windows_x86.zip'
$url64      = 'http://dl.interfaceware.com/iguana/windows/6_0_7/iguana_noinstaller_6_0_7_windows_x64.zip'
$checksum   = 'c5a26f816d0e9e9ebb6f1ee336610fe7e14a9323982cb2a8810d2612342247a9'
$checksum64 = '078c661b588e7bb7be1534b358d442c6443d5e7074ac4139d54a57810b588cb6'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  softwareName  = 'iguana.portable*'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}
