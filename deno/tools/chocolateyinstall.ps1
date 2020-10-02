$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '9208b98e683e9069269d63f273539c008dc58149299accf2752b18386881a1a0a08eaa4188e60672ad1b0e616140e2991b091dbd7428500dcaaef0c7d5b813f7'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
