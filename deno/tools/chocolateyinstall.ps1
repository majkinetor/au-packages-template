$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/denoland/deno/releases/download/v0.29.0/deno_win_x64.zip'
$checksum64 = 'dcbdf58c851a326f34d3f5e819e4611389f9c2350c52d2e544ff9192f280b427529ba694ece9335909fcd7cef2d591c62d563eb14ca574006013522445729b8f'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
Write-Output "Run 'deno --help' to get started"
