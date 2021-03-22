$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.8.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '5c96893df99d45d2e0e55ea7608d774a3732b32073e1dc89f4ae521442017b3dd0de4e2349b9e9e2bb8483801481adfa77d26e5d624ab33a60d7a340c5bb18d6'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
