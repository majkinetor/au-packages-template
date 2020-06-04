$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.5/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'fb43d36e4a90a3ea84a6ba42dab690a04bb628a3722817f769d4d81971bf243bcd31780a6be83d398b7c2e04909b86b472af422b2bdfc16e6f712dfc9b9c9111'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
