$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.4/buffalo_0.15.4_windows_i386.tar.gz'
$url64 = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.4/buffalo_0.15.4_windows_x86_64.tar.gz'
$checksum32 = '176bcb12a5887056f1539b5e9355e76acea675a007fac9155a2e1b70eec4fef6376b25ed6a95d70e6462aa065a0a14235d172fd54657af837999fbc5b802f5b9'
$checksum64 = '57831a2fc283125c45781d9949903c8db2075e8e74346aea2fc5b38c0174636c994eca44bf2f532d4c60bfdbbae18150138ccbe686a1490d99bd5ca78fd2e2f1'
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
