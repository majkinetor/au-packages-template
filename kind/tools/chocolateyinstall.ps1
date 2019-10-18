$ErrorActionPreference = 'Stop';

$url64 = ''
$checksum64 = ''
$checksumType64 = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'kind.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url64 $url64  `
 -CheckSum64 $checksum64 `
 -CheckSumType64 $checksumType64