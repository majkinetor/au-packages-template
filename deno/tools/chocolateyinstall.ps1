$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.2.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'd66bed77f00e126fe12b289dbfe3de7e3b836ad67ccb698983a7e6d9b436c628f3e3a421e54b7321e4af1ed90b8ea0dc6b14d635730d071c30747198ede25e8e'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
