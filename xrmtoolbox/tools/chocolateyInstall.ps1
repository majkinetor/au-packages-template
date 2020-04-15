$ErrorActionPreference = 'Stop'

$packageName = 'xrmtoolbox'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$pp = Get-PackageParameters
$installDir = $toolsPath
if ($pp.InstallDir -or $pp.InstallationPath ) { $InstallDir = $pp.InstallDir + $pp.InstallationPath }
Write-Host "XrmToolBox is going to be installed in '$installDir'"

Remove-Item "$toolsPath\xrmtoolbox" -Recurse -Force -ea 0

$packageArgs = @{
  PackageName    = $packageName
  FileFullPath64 = Get-Item $toolsPath\XrmToolBox.zip
  Destination    = $toolsPath
}
Get-ChocolateyUnzip @packageArgs
if ($installDir -ne $toolsPath) { Install-ChocolateyPath $installDir }
