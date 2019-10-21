$ErrorActionPreference = 'Stop';

$url32 = ''
$url64 = ''
$checksum32 = ''
$checksum64 = ''
$checksumType32 = 'sha512'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath (Join-Path $UnzipLocation 'buffalo.tar.gz') `
 -Url $url32  `
 -Url64bit $url64  `
 -CheckSum $checksum32 `
 -CheckSum64 $checksum64 `
 -CheckSumType $checksumType32 `
 -CheckSumType64 $checksumType64

  & 7z x $file -aoa -o"buffalo.tar"
  $tarball = Get-ChildItem -Path 'buffalo.tar'
  & 7z x "buffalo.tar\$tarball" -aoa -ttar -o"buffalo"
  Copy-Item -Path 'buffalo\buffalo.exe' -Destination "$UnzipLocation\buffalo.exe"