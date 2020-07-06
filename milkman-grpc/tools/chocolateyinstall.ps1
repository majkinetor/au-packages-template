$ErrorActionPreference = 'Stop';

$checksum64 = '60DDBF55CDCB2C183889BDCB41F5F59BDFD4B437CEE3F5BEAED121E57CCB1291C5A20075D617A1E60018122A8ADD70787F91EF0CBEB2BCEC924CBBCC6BDFBFC4'
$checksumType64 = 'sha512'
$JarFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum $checksum64 -CheckSumType $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($env:ChocolateyPackageName) to $($InstallLocation)"
