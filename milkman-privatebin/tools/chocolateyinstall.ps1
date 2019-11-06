$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=31B13312BC9829CBDA970C8F708C39109E70C3BB1A4936F89567A9441FF923D2D4753026BEEF35CF176ABB4A8D801C540025A72783A6F1394226FB592BF87100; Path=C:\projects\au-packages\milkman-privatebin\tools\milkman-privatebin.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
