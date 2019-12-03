$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.3/buffalo_0.15.3_windows_i386.tar.gz'
$url64 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.3/buffalo_0.15.3_windows_x86_64.tar.gz'
$checksum32 = '363f634e49eafe4d8fbd47ad19e19ae4c5f70ad13602d136b6e53b4992b9e3097034c69eef1651b21cce989c4325d885c717363c8f9f273462c1a84482aac1a8'
$checksum64 = 'c5b1c9358cb8e3be031e4991288b4f577862ad0a117a5e7f209e0b12b97b985436ba323a15404789f94faa289c8b4acfe514792418b28c48fa85a882285c79c6'
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
