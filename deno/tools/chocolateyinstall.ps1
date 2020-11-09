$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v1.5.2/deno-x86_64-pc-windows-msvc.zip'
$checksum64 = '5ff8cf0869e150e728657643f22dc82370afa9060426d7fc8df3aa3c111817fcb70f309a10fe50085849e5d72d1a0dd0174e3811dbc720f6b2baaa4dd85ed6f4'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
