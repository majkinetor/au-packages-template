$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.1.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'eb3736e7e8fb55490316b5a09f30cbf809d8b0d551a76d37509c5d3472dc12dd1c64212f1ee3a48041d5b274baa6a0d525bce54b11417791f6a18143e09a4226'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
