$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.28.0/deno_win_x64.zip'
$checksum64 = 'cac0155cbc8e460b0cbbdd94e024ec7d19a99ad37af7e0f566e429501c15654e8537cb840289557f52330c77873c8e8463f1dbf143cee2c407c91e2512fe9ef1'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
