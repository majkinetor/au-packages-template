$ErrorActionPreference = 'Stop';

$checksum64 = 'F9610A5B294B532F8181AAFDEC860C0CC6B16B31D3E2AA8D07E665068864061109B23E5216BB6F72634775380939935C732915A1E89BD550A149A1DCD8B16CC1'
$checksumType64 = 'sha512'
$JarFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum $checksum64 -CheckSumType $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($env:ChocolateyPackageName) to $($InstallLocation)"
