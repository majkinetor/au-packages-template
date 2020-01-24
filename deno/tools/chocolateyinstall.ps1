$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.31.0/deno_win_x64.zip'
$checksum64 = '077650ab785492154092c7b66a04f21d1896d231eb8568d2be4d439c451751005ae3f5b6e10e29ba645c6eef751289e6eeae12790f4131c81d5bda76f4f7f31d'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
