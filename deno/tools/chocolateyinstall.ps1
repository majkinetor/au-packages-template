$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.0.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'c327df1094d5efeaef66291cc54391443cbcba01cb6da3c2a16577504e1aa68765b6b3bc5163a4f521caaf094ac4730ba2ab18182b2ee62ede5c7e3a964f2581'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
