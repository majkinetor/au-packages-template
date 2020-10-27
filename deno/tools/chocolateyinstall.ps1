$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.5.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'a12b94028496f2ac11a2cb37101acadcf34fb6fb1c40813712441018483009971713cd3a7b1b701b5bd7fb88807d6b22b953af67037fe23f2da10c70d229e793'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
