$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.8.0/kind-windows-amd64'
$checksum64 = '25dbb892ce1d81b180b4359f1ac20e16617b00b3d8bdfe65315dd4f29ad2919874e07ebcd5f2a0f10f33aa5bce79a5d05ba686e8b249b76237c8961397f07660'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
