$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.6.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '11e0d6a8e8680760ec3678db27d1189b8d4430ffaf9008b16d64fc51225d383f7c4279291cdf009a86444fdc1c0aa616ef6b9b4f73f8c814522981f643f88d5e'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
