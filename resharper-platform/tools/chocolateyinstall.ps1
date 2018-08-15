$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'JetBrains.ReSharperUltimate.2018.2.EAP6.Checked.exe'
$checksum = '969c2309825669a00946f7a53fe903b9163d5df118b9f39b893b31c6794f1de4'

$url = 'https://download.jetbrains.com/resharper/ReSharperUltimate.2018.2.EAP6/JetBrains.ReSharperUltimate.2018.2.EAP6.Checked.exe'
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
