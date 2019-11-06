$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.23.0/deno_win_x64.zip'
$checksum64 = 'fb07055300cc5f1b1156090be2c86376cc9535913fe844d51504a6b615cf1505b9a11abec9e0f215ea6769ceea0e307ea3f7e53780dc15c8e8b34c92fa2d3335'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
