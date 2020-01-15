$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/warmuuh/milkman/releases/download/3.7.1/milkman-dist-win64-bin.zip'
$checksum64 = 'caa1bd772a948bd77a9cfae0d2572b04234b9d84c7bdb53671e64d1b1f6875b14fa4a571939f41bdef468c384ff53a2945659b284dfbb768ea6f7b477fa8807e'
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
Copy-Item -Path $ExecutableFolder -Destination $InstallLocation -Recurse -Force
Remove-Item -Path $ExecutableFolder -Recurse -Force
Write-Host "Installed $($env:ChocolateyPackageName) to $($InstallLocation)"
