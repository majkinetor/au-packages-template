$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=7C3ED6FF2BD0A91E552697A98B142D21F56CC82F29A78F5095436F880975A3215E96576EE5B920F408DF6BBD6EE8E820F8F624C8FDCA9E0ACB3B7648847CE4BB; Path=C:\projects\au-packages\milkman-sync-git\tools\milkman-sync-git.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
