$ErrorActionPreference = 'Stop';

$checksum64 = '@{Algorithm=SHA512; Hash=84EEE9173745464EE439371A84F59C083068FA08011D9E781EBB963C81E63A975D985A509CE8349EECC95B9C78C33A288B39722F33E83B48BED42459A6E07CB0; Path=C:\projects\au-packages\milkman-graphql\tools\milkman-graphql.jar}'
$checksumType64 = 'sha512'
$JarFile = Get-ChildItem -Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) -Filter "$env:ChocolateyPackageName.jar"
Get-ChecksumValid -File $JarFile -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$InstallLocation = (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar")
Copy-Item -Path $JarFile -Destination $InstallLocation -Recurse
Remove-Item -Path $JarFile -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
