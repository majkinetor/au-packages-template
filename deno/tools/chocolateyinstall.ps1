$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.20.0/deno_win_x64.zip'
$checksum64 = '6a3c4c49c846633692e42306eb3b6e859cc726162247ed11043369a45e3d1451d3619eb4c8f1ea23453468d65e27298d09a02a135db1a1f7835d957da1e8e007'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url $url64 -UnzipLocation $UnzipLocation -CheckSum $checksum64 -CheckSumType $checksumType64
Write-Output "Run 'deno --help' to get started"
