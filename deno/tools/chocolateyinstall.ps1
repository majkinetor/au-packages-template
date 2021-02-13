$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.7.4/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '2c910e9fbd5c07a49cde269c1fe26a9f071d49b549c25579815672e7b387b5c331637c042f4c0f3017754615fccbdf396bda405db34a983a49258a86e471c9ca'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
