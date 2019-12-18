$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/vvatanabe/gitb/releases/download/2.2.1/gitb_2.2.1_windows_amd64.zip'
$url32 = 'https://github.com/vvatanabe/gitb/releases/download/2.2.1/gitb_2.2.1_windows_386.zip'
$checksum64 = 'c13938f8da1a2d3d5be3058f19502c464aa6e52ce161ba0fd1c89b934df98861a0b8a421996d6600bc26bac28336650d9c309ccf7e3ac982fa974ccc6fd95dfc'
$checksum32 = '272739ef6f9532e95462abe57cc1264161942c8f84944a23c3d60010ba17dcf24bd9e19bdbf0101f31c74a4bdb72e958a646786fe038fe207779275a00ea71e8'
$checksumType64 = 'sha512'
$checksumType32 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName `
-Url $url32 `
-Url64 $url64 `
-UnzipLocation $UnzipLocation `
-CheckSum $checksum32 `
-CheckSum64 $checksum64 `
-CheckSumType $checksumType32 `
-CheckSumType64 $checksumType64 

$tempUnzipfolder = Get-ChildItem -Path $UnzipLocation -Directory -Filter 'gitb*'
$tempUnzipfolder = Join-Path $UnzipLocation $tempUnzipfolder
Copy-Item -Path "$tempUnzipfolder\*" -Destination $UnzipLocation -Force
Remove-Item -Path $tempUnzipfolder -Force -Recurse
Rename-Item "$(Join-Path $UnzipLocation 'gitb')" -NewName 'gitb.exe'
