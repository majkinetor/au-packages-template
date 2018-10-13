$ErrorActionPreference = 'Stop';

$packageName= 'iguana.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/6_1_2/iguana_noinstaller_6_1_2_windows_x86.zip'
$url64      = 'http://dl.interfaceware.com/iguana/windows/6_1_2/iguana_noinstaller_6_1_2_windows_x64.zip'
$checksum   = 'a0c1c00041a72d5c88cd013c8044314a2a140563d3fe109d666d356a277c839e'
$checksum64 = '213fc4e0c389e6319d491ac22003a3a716bf8950070021685cceb66f9794b5cf'

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
