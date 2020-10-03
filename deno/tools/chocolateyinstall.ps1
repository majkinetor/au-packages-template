$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.4/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'a4aff323bcec25e5fc509ff40df3c4a9fee2beaef4cb8caa3208ba3283ba8f1cb95af42a88c092fd4faa9f7e938d965b4171bd134b79ec4353a9d98467bfff95'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
