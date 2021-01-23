$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.10.0/kind-windows-amd64'
$checksum64 = 'a9d15420ac860e02a1ac7fe77c2a3ee7f24717ea64de982bdb89469f17646cc66e9f0caa33985a85f98a43db5e467a8760016ae983d67db27a9ee9e3c2c87bac'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
