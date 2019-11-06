$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=E64008307205A30AB69A913B16B7C1D6A5A9E10CFE6A829CFE4EE8D22DEA097C9D0487CEDB77BF02E9E7B5DEF7C584D0DCE426DC00BEA889D3C9C67633619302; Path=C:\projects\au-packages\milkman-jdbc\tools\milkman-jdbc.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
