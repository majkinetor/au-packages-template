$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'd259ce7185a16f0589112d22a4a3ffed8b57c4523f9e29cf7fd4ce982dbaeb0d7dd8c04c7d7cf20fd7efd4d5e0245b6ce56b7f88a7fd6aef0a9576f244f12929'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
