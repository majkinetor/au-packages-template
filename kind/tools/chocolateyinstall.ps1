$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.6.1/kind-windows-amd64'
$checksum64 = '3151ac2e3cfbb122a7e7c1d5f81b443ae27d6e1a6e686dea18d861674fd76cf2381e97a7f5a60468c638d12f1fca310461ea232d996b6d74d53e09a48820458a'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64bit $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
