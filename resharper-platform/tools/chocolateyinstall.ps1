$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = 'JetBrains.ReSharperUltimate.2019.3.EAP2.Checked.exe'
$checksum = '21222146b9f4bccd7862bb2548e39015211f381ceda5aa672b3bdb2a841edf3a'

$url = 'https://download.jetbrains.com/resharper/ReSharperUltimate.2019.3.EAP2/JetBrains.ReSharperUltimate.2019.3.EAP2.Checked.exe'
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
