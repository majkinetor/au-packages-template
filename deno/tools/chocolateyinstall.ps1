$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'c10318fef87f287b6152001b0347c661906900dd1b19a6017960dbf901b986534648a40053ee860c8663f2947f1737ade2a7820e12568b01f612ee1c8c29b879'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
