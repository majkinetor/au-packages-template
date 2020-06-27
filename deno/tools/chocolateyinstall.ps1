$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.1.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '3ad93f6a2c9c564d226563cb1db8cce952a3c0bc692d45a408f619cbd2ac94697a2e84de7cb5f5e5d23a189457b548bb1893cf33ce1ab70e8750241787815123'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
