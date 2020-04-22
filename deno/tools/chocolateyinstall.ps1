$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.41.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '3b302e55b77a3e73fc7e30e71910a93c7e4268eb93778d6bc88520b8e941ccaecf39213fddb2d01c5c737b04240f8c45b2b9fd5ff271d0bff4d181643f2a0d31'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
