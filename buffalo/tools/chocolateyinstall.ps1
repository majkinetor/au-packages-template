$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.14.11/buffalo_0.14.11_windows_386.tar.gz'
$url64 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.14.11/buffalo_0.14.11_windows_amd64.tar.gz'
$checksum32 = 'c9d24f2eba0727bd4115e02381bf8534a51519fdc3e15fd11a5753c8a6b67dfbe9d5be2f817d293ea4c4d4a0cc4bf7510860b9b6dd96415dea68add15a9d4a3b'
$checksum64 = 'ed5a3fa14e3c01e6492cce50af6eb50d429eabee146b8c094dc708a6bef753dea77a1cf88f62efd50e453ca4f22a350f5b56fec2c0ae0e06b7e362a0118473af'
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
