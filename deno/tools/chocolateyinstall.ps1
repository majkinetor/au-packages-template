$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.2.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'f8eef3ebdee8e0e15f92cb1b9f5f7d28c85913a9fd3c9122fce42ca42486c3837c1d153ca1279d94f2f4be39300dcfe0648d957be590c4df3bc03d5fa193afe3'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
