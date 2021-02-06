$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.7.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'a4dcdb88bb38b55ece8603b83e8e3858543f5dae94f2e39ca12fddbc11f7336f8e491d39c5ec9be5d03f328742e7623b49c38bf470f1bde235618ab85bc31bfe'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
