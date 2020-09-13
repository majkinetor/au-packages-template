$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.4.0/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = 'baf56dadbc43a4cc7521d4beae90584aaac8df1f3a4d55df72068509911796b06d47f48dc0650508688570b6b275118f5b4cb9808ae1113f4cfd9547a2c5e56b'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
