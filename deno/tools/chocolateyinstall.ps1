$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.36.0/deno_win_x64.zip'
$checksum64 = '1252c4244e222aa7b4850e616bac65a50ba535a7bea908d2777e77f6588ac5a938d19220080e27228624fc94b561917d3ee7cd99bc86390fbf5d3d2aee6f27b1'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
