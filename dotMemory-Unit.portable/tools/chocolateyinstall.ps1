$ErrorActionPreference = 'Stop'; # stop on all errors

$url = 'https://download.jetbrains.com/resharper/JetBrains.dotMemoryUnit.3.0.20171219.105559.zip'
$checksum = '02b3463a99d922a431f5ecb3167d2e3473e73b086aed4cb7fb6a811ce5f50ace'

$installPath  = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  UnzipLocation = $installPath
  checksum      = $checksum
  ChecksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Exclude ancillory executables from shimming
$files = Get-ChildItem $installPath -Recurse -Include *.exe -Exclude dotMemoryUnit.exe

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
