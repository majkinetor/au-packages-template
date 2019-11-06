$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=AEB57C00E605CBFF904E79E3796ED4B4DA971430820C1786F5502DFE523D81A88E99E3D34CAAE56445F783D1F2D3D8E2FC66AB9F334D97CFC4D409BB1E514FC6; Path=C:\projects\au-packages\milkman-scripting\tools\milkman-scripting.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
