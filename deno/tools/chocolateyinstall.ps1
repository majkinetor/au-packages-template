$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.6/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'e78b61b81739b24de9e049939249934551eb6db76f5005fb842367b13238b6525624e67b536fb67fd779d20b869fcdf80f834f4bdc18e11c1b2912d775f57d1a'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
