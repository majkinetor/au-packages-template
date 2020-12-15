$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.6.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '3f14d71a2bc63cd4c3df3ebaaae7b231a79fd2744002916d2637bbec27f6dde4e9ff1a61fda3c1b4d86d09e8a25911d79c909c24284968b292f7849d770a3321'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
