$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.6.0/kind-windows-amd64'
$checksum64 = 'fc350da228d1237fdb8c0b370bd46f4d4d81cdeae25b7804c435e2643e12643926df8d95a444b430e8683a0fa7da4df60cad2450563d6c3d0fa7769f7a5822a8'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
