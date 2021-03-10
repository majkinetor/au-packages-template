$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.8.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '21c5d69a6e306f6276deecf2aee7eb27de1efec2681e6d231bf73825d4586d3bd37019b42f0522187a422b8c2ca4fb9b209c7fc4ae0e415c8b73a880e1c62ee2'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
