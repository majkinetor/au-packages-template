$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '7d964410f2ce2cf806965b850ad821bf8b12e0c34287fb72d14dce98cb22a4b4dddba7871962ae390966dd41b4bbda325a18545f259e15946bfd03211eb174ac'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
