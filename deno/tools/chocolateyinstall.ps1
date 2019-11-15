$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.24.0/deno_win_x64.zip'
$checksum64 = 'ef8e0191e3d36b4503c5732dae710ec5cf510e375aa023ed3b4016d9f42974aed0d0470a497d8ba5bfaa4c478b349395c3048bc33b5b3fee3e22ae2f17735c3d'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
