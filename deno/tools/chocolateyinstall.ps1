$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.2.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'b44f3bc6b4148de6f322de020cd12f38a4275fcc823639b746f6c3f49b10ec69a3c8e8fa93836502028e02663be98129285c4542707efa404633d5e0224669bf'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
