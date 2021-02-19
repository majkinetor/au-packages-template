$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.7.5/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '50ca911468bf5b03b453f98deabf46fb8e5efe7cf94585a4e23d8139b146c24709f1b9e6f30fdb6f70bc530a11ca041b97710e9771c622e7d3724a2b17575dab'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
