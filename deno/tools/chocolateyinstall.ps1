$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '136b4e46a5d679382a4b85c525b7eed09f687528d53687386fa7a6da99de31fc223563edc2bf9137d622f6b874eb6f847513e5f64f961d6e5bbdde94f2095c31'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
