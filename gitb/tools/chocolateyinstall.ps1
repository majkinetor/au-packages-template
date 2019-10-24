$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/vvatanabe/gitb/releases/download/2.0.1/gitb_2.0.1_windows_amd64.zip'
$url32 = 'https://github.com/vvatanabe/gitb/releases/download/2.0.1/gitb_2.0.1_windows_386.zip'
$checksum64 = '03888ac2dd23f2e2bc70cde31d185edd8c4040976cebe3a46045341c0d43c74e29124ba80d88e22fe15b0a5ace05a1684e8728f1ffcb4307bd295d3b92854b83'
$checksum32 = '88e1494e9454ec1d3ecfa9a33dac3f93a1e3ea38be9e24c288556df41ff43fc91f2b90d494a2db95672c1e9357007c14fd0225c97714e124c62719b673712821'
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
