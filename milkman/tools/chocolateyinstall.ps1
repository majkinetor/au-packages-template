$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/warmuuh/milkman/releases/download/5.1.0/milkman-dist-win64-bin.zip'
$checksum64 = 'c07c6015b8e0ec20ec2eb43d9f55115a1876ea86f727ef6fbe96c80a91dda33b6a33db4ea8a35ca5f661d7f6ad004b532ace92af994d8e5155edca55691cd8e0'
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
