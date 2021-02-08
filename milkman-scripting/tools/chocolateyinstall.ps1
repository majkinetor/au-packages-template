$ErrorActionPreference = 'Stop';

$checksum64 = 'ACE4F555D71A8C519B5CD8DD899AF6FA8366C1AEE8A6EA0AB99D2BBCBE90D7F43B6065E5F64EFCFEE87404A8E0BD990AE3C383CF9E7F08DB4593C44B8D786A9D'
$checksumType64 = 'sha512'
$JarFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum $checksum64 -CheckSumType $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($env:ChocolateyPackageName) to $($InstallLocation)"
