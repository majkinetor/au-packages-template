$ErrorActionPreference = 'Stop';

$packageName= 'iguana.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/6_0_6/iguana_noinstaller_6_0_6_windows_x86.zip'
$url64      = 'http://dl.interfaceware.com/iguana/windows/6_0_6/iguana_noinstaller_6_0_6_windows_x64.zip'
$checksum   = '2e2fdfd1a77d00e618ae53af3ad5bc734dbb29982665dbcd1c3a3d827e267b01'
$checksum64 = '2fb84a55126b7934c261634f264fedfbe251e5264dfd3c1641d742eb40be9a59'

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
