$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.3.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '1af9cba87b4a68458c6e87a46cb68b2afe1f32c71e5e3ed07e482c4e3557add6b43a807bcfc62a46507767cbc92981508fa695624e09ce9432c9218f571a8c30'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
