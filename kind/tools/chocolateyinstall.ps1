$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.9.0/kind-windows-amd64'
$checksum64 = '81d9844091bdd96c499b1c4f8d6dbff9a01aa328af16471730a6b9c122beb59b076e1451681d0eb90040adf5a01dcfeb686da3a447c47e56fa7e0766882cc683'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
