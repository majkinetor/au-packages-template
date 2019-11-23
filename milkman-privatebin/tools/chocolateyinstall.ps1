$ErrorActionPreference = 'Stop';

$checksum64 = '31B13312BC9829CBDA970C8F708C39109E70C3BB1A4936F89567A9441FF923D2D4753026BEEF35CF176ABB4A8D801C540025A72783A6F1394226FB592BF87100; Path=C:\projects\au-packages\milkman-privatebin\tools\milkman-privatebin.jar}'
$checksumType64 = 'sha512'
$JarFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum $checksum64 -CheckSumType $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($env:ChocolateyPackageName) to $($InstallLocation)"
