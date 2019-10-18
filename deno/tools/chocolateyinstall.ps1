$ErrorActionPreference = 'Stop';

$url64 = ''
$checksum64 = ''
$checksumType64 = ''
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url $url64 -UnzipLocation $UnzipLocation -CheckSum $checksum64 -CheckSumType $checksumType64
Write-Output "Run 'deno --help' to get started"