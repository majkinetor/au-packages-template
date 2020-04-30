$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.42.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '6c1d32181bbd54bc47b5264d4d8ca2146aef495c315b03b6624d95e82e3023a5a0ed6916cbbd87f4e69bba153793d57ff9362dacdccd7d1a068ce1f7ef2483df'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
