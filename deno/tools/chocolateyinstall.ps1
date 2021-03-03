$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.8.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '97fac869bc0defc240d77ddfc955b6e724204cb0f43bf5242817d2e5730ced7c758ba0eed2ddcf5889dc46b2087b5c0877d77a0631a8ba875f158e90f41af1c7'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
