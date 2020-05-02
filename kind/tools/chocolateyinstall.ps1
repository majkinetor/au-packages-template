$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.8.1/kind-windows-amd64'
$checksum64 = '2604d78bb2727a74bb2cf253acf3b132e54bcdcb6d5c5e22ce66d8f5c470b9464484011fdbbe7a7c6eb8730f390421e1752885202d89536b031afaaa12efb197'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
