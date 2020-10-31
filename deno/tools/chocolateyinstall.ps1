$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.5.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'ec78569dc900c7ec5b36f4d5a736be965c4113d3f4a7c539506bd2850f255a5f641c5745cbe9b9d2aafa2920073f0e7b9b445af0b56bc47c022bc218c3ca113c'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
