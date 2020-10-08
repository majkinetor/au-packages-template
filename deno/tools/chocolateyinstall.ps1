$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.5/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '63ece2392a875d571c564942613db17649aecf0f41c3889c15a8bb3d21e9f9bb0b5939fc74d8f2f4f89b6bb9e61f6aeee85edae56a5ddc2e81d8d0a7fd423844'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
