$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.25.0/deno_win_x64.zip'
$checksum64 = 'b20b8d4f897ac498ed576afa647c80cedc65796bd47dbb7cb5753fbe252a1ac91d0446066cea223f009d5bcac83802206baa7af4ee3adb58a99e5e0c46c09136'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
