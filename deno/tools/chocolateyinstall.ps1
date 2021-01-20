$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.7.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'c45c25abfbb8ecb3dff914617dd55870efeaa43d7a90495f917287f45185d83637c4dc109776212427fb357f5d8a28f1778cd14e75e6cca76383481ec51b44ee'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
