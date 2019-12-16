$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.26.0/deno_win_x64.zip'
$checksum64 = '4a4577bedc92ecce6aca70a20afd7449ed1d0b9f1fbfe50575469d2007dc32c4c1d182f7ce8164ba68a97694220564ff3f41df10720744a7c55fc3a18e443ccc'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
