$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-windows-amd64'
$checksum64 = 'c3c98e6de64a19cf8362d52f259e3ae62a47498568ad25e27c76e76bd85f5f98686e44716fedccc6102377ccb3481f036888e12d804d7312e4541f5a5007629f'
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64 $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64
