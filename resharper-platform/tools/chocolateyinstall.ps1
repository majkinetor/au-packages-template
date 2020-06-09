$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'JetBrains.ReSharperUltimate.2020.2.EAP1.Checked.exe'
$checksum = 'f2c26bf3d950cf77c2a8d92a74140c40bbd0032f2015a618a1dcdfda121c3aa7'

$url = 'https://download.jetbrains.com/resharper/ReSharperUltimate.2020.2.EAP1/JetBrains.ReSharperUltimate.2020.2.EAP1.Checked.exe'
$packagePath = $(Split-Path -parent $toolsDir)
$installPath = Join-Path $packagePath $filename

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $installPath
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Exclude from shimming
$files = get-childitem $packagePath -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
