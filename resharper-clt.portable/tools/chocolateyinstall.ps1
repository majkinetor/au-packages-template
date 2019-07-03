$ErrorActionPreference = 'Stop'; # stop on all errors

$url = 'https://download.jetbrains.com/resharper/ReSharperUltimate.2019.2.EAP1/JetBrains.ReSharper.CommandLineTools.2019.2.EAP1.Checked.zip'
$checksum = '2318e2ca5feab242308f4cd6ace44e2de1231e7e7f87021ee29f514a0528ee6d'

$installPath  = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  UnzipLocation = $installPath
  checksum      = $checksum
  ChecksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Exclude from shimming
$files = Get-ChildItem $installPath -Recurse -Include *.exe -Exclude cleanupcode*.exe,dupfinder.exe,inspectcode*.exe

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
