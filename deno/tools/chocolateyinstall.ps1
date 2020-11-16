$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.5.3/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '7c125cf6c3aedf9f9e8dc37f7736cb50ad610b1bb13a297a14967c2a34112d2f1c330d83df0f027f24a8c7f67f2ea2d4161e48c79eacae196a60d0e517d37deb'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
