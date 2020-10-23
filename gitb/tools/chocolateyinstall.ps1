$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/vvatanabe/gitb/releases/download/2.3.0/gitb_2.3.0_windows_amd64.zip'
$url32 = 'https://github.com/vvatanabe/gitb/releases/download/2.3.0/gitb_2.3.0_windows_386.zip'
$checksum64 = '23e12aafdba29706864ebd9783b5409ec2267af8a04d8cb0a378905ecbf1260498be0006dddf88f44fa3db61068e28c22d75a47eae4f149043ebee3e580b831a'
$checksum32 = 'ed3ceca13e353dfe9edb85faed78001ceedfbfed4561d18d215cfa1870bb56a83670b0c91159b3ad0678dafeb3cf57a06fbccf807fc1c08f1b68472c2c4a8e83'
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
