$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.6.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '0431875132b7806e7bf0e7b620326fbe3b0bdabc61f37977d4eec96cf4e310a3d899aef023de0750a4b103a01b30f9f9030b78f10bb0f1505bdc8c2ee7e598ef'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
