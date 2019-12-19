$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.27.0/deno_win_x64.zip'
$checksum64 = 'a7540d5091104ff379aa59f6fd763daffd4f8d3956ab9920796268a92785769cbab10481f83b5f147a75f48d8c02ff2e91829e8ed13e231e195ca105da75f23a'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
