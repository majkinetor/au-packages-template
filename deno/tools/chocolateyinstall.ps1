$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.5.4/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '0a69a600b4055a86fa050ab99b9583dd6c8f824b6b3b0de424f64e6c9a13c96e9e150176c856edbb71320daf95c20df06bb0f3fd3cb023614754d8dd4feeef81'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
