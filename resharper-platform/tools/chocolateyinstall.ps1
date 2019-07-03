$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'JetBrains.ReSharperUltimate.2019.2.EAP1.Checked.exe'
$checksum = '9b37d643472e54a4df8b20dcbe1c5db47e167e52e0d159c116db08c34609e912'

$url = 'https://download.jetbrains.com/resharper/ReSharperUltimate.2019.2.EAP1/JetBrains.ReSharperUltimate.2019.2.EAP1.Checked.exe'
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
