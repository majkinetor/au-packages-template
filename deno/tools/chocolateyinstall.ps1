$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.7.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'c6368396094fba43118deecfa1ea6633108879a99e8fb75eaaae2a2c888685afd67cd1c69c58adb5b508119c321b53bc0dc6e4214d7926a66fdda24c24c08ea1'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
