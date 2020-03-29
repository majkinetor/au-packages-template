$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.38.0/deno_win_x64.zip'
$checksum64 = 'dab3085f01990a84d7976b99f94dd8ffe2e32a0e3365bb51784e863a81506ff3152d993ef6ff73b58a225f2309dcbb4a9fa71d902fba3c9c4989fc086c73fb4e'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
