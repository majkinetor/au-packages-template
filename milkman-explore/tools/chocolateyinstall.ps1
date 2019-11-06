$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=A4E7404FAA69B092D10A2027104367A2DDCD15DBA41A9363130F9F328C405CDE561AE2F4FF260FCE7636C692F8AB7BFDF8E5FDE0E044D999B2FA784959AB1ECE; Path=C:\projects\au-packages\milkman-explore\tools\milkman-explore.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
