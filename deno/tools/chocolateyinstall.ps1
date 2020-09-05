$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.3.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '19550c3648fca2e30ec5204f5c04ce715ee639f6d0c290b65c6492b0aa257811c9bc0af5aa34311deab8bc58cd4eaf75f8314a84d34bfbe91180e52651a55d37'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
