$ErrorActionPreference = 'Stop';

$packageName= 'iguana.portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/snapshot/iguana_noinstaller_branch_5_6_windows_x86.zip'
$url64      = 'http://dl.interfaceware.com/iguana/windows/snapshot/iguana_noinstaller_branch_5_6_windows_x64.zip'
$checksum   = 'FA15F06B8D13B0B8E1EC82EA9D441EAAAEFA068DEB4A8BF7001928E9A580E92F'
$checksum64 = 'CD12725E67D2213F61371F264EF00329D63A9EA926EDACC1D2CD0981D0305A61'

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