$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=2EE1AFABB17B106B76378DE4E61A490D84022157CBB65B84FD905693B2A4408CCDBA55B40950DEEC53197A9C12E47DC7703C212CB93514BF74432489A478AB00; Path=C:\projects\au-packages\milkman-note\tools\milkman-note.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
