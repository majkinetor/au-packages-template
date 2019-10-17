$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/mypaint/mypaint/releases/download/v2.0.0-alpha.12/mypaint-git-w64-2.0.0-alpha-master.502-installer.exe'
$checksum32 = 'beaeff34990681d69091933734d813464daafe7a632aed5a86f002b491753841f9819f2f15d2abe3bc8bff4cd8d7890f85cb788ba2e4351a5c2366364613ff06'
$checksumType32 = 'sha512'
Install-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/S' -Url $url32 -Checksum $checksum32 -ChecksumType $checksumType32
  # [-Url64bit <String>] `
  # [-ValidExitCodes <Object>] `
  # [-Options <Hashtable>] `
  # [-File <String>] `
  # [-File64 <String>] `
  # [-UseOnlyPackageSilentArguments] `
  # [-UseOriginalLocation] `
  # [-IgnoredArguments <Object[]>] [<CommonParameters>]<#  #>
