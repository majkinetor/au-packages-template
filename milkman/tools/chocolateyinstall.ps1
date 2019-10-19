$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/warmuuh/milkman/releases/download/3.6.0/milkman-dist-win64-bin.zip'
$checksum64 = '258bf82c535b344f4fd8999ae80e8393c5eb764b185314581e28336288a080f6bc9d498c42085c7afeca48495e3d3977cf578bb80dfcf55f433ed69f3ad5546c'
$checksumType64 = 'sha512'
$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
Install-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName -Url64 $url64 -UnzipLocation $UnzipLocation -CheckSum64 $checksum64 -CheckSumType64 $checksumType64
$ExecutableFiles = get-childitem $UnzipLocation -include *.exe -recurse

foreach ($file in $ExecutableFiles) {
  if($file -match '.*\.exe\.ignore$'){
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null}
}

$ExecutableFolder = Join-Path $UnzipLocation ("$($env:ChocolateyPackageName)-" + $env:ChocolateyPackageVersion)
Rename-Item -Path $ExecutableFolder -NewName $env:ChocolateyPackageName
$ExecutableFolder = Join-Path $UnzipLocation $env:ChocolateyPackageName

$InstallLocation = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
Copy-Item -Path $ExecutableFolder -Destination $InstallLocation -Recurse
Remove-Item -Path $ExecutableFolder -Recurse -Force
Write-Host "Installed $($envChocolateyPackageName) to $($InstallLocation)"
