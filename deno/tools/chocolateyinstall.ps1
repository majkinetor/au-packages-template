$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'fc132ce7c4dda319c972322b0481b7d0048dcc11a1649d537a43730121d6ed6d965bdbf66e26f7e937937a28fa57bc512a71bc041b149862d29f1394519b6c0b'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
