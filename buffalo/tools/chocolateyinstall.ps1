$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.1/buffalo_0.15.1_windows_386.tar.gz'
$url64 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.1/buffalo_0.15.1_windows_amd64.tar.gz'
$checksum32 = '9cd6f1a5d62299ba46b5e6a30cadf67334235c46f5e3beca346c425c60b85cb027211586915182d2c555e5854d20a3f35e04f5070c4868010e8811853ad970d2'
$checksum64 = '14474423add4e4b597c5dbd0a0636b27c3df41850c201fa7b08e593f1a8c07047530c86adbbbc80f6451f801adbf99faaa50c811012c243837ff35940839f173'
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
