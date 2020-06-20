$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.1.1/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '1cdf30b565af03bb9fa2b4c13c44ce2be0fb6823d1dc413cbc612b6a32580634d3194ba7a487471bd735e398211537147d1eaf1c786117f7d407cc6bdd872720'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
