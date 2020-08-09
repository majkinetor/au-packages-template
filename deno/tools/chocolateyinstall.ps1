$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.2.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'eff0a79a43feaf3b43291a4f9c1be6a36693442f13e64cbc5d6c55189f7bd51127ca020a7d0227b37dcdde0090b2612a3a7082a6ded535d542d34595bf8c7641'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
