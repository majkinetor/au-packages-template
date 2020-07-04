$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.1.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'a2eabdea87626d39506850db39e22e5220b7d0c88ea1522d10b6661eca1b168ead28c057640e33c5bb074bbf2df423cca4caee5699386b646caf12d11ad3dfd4'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
