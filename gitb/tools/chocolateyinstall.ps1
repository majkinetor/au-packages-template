$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/vvatanabe/gitb/releases/download/2.3.1/gitb_2.3.1_windows_amd64.zip'
$url32 = 'https://github.com/vvatanabe/gitb/releases/download/2.3.1/gitb_2.3.1_windows_386.zip'
$checksum64 = '14b744b10a8e9ca2989610164e161b24934e8706fecb223e9836f17725565c6526a31ab27669a75a8c952ec397090d05d0f1a2ff94bea4431ffb44dea0945b94'
$checksum32 = '305e1a820c5519678e48f92b31c4a9defca2fff649474724d495fe2133b82e83d3f3c0ecfe62d2255d719ebb7fc7af0934e6d687039fc9125f45d96f79c1ab96'
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
