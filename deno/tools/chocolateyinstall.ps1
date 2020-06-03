$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.4/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'b3d361bba5c0947a997633d50c732af7a551258ceb9079742bddee6aa13f99459d18ee2d225a438c0227068602b29a806e63946a979ddcf210d794e18a45ac75'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
