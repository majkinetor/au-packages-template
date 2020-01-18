$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.30.0/deno_win_x64.zip'
$checksum64 = '64d3888e46620a5dd6fa727c0aff89a2106d27df5856a8f338bc94dbb0b94c7ba9aba6aed4024656ad599e2b5bae492cda86653f1ec48e6b3a1723fdf0d54d56'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
