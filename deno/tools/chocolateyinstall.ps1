$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.6.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '2f55775e357f5c491bc8449224a8411c287f6970ad50cec4bed6dea650c27ebce215677833aed2150e27679724040dbac682458c6136b758aa9fb9c2577e14f0'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
