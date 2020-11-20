$ErrorActionPreference = 'Stop';

$url64 = 'https://github.com/warmuuh/milkman/releases/download/5.0.0/milkman-dist-win64-bin.zip'
$checksum64 = '367103fa25316f8f748fd235180838ed40695f7cc947e2b53a4e741112444632d9a69de5cb76b81f859d2ed6934e0c2e0a967fd59292abf19ee143ea6588b40d'
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
