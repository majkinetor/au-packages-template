$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.3.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'd4cf51410a546f90a043bc4659472fcd5471fc0320bca8b5e33096f7e98041855845fb70a80227fbc910c24998a07f6845a33ac5b4cc8b954bec7c2d2559ab40'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
