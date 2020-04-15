$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$pp = Get-PackageParameters
$installDir = $toolsPath
if ($pp.InstallDir -or $pp.InstallationPath ) { $InstallDir = $pp.InstallDir + $pp.InstallationPath }
Write-Host "XrmToolBox is going to be installed in '$installDir'"

$packageArgs = @{
  packageName    = 'xrmtoolbox'
  url64bit       = 'https://github.com/MscrmTools/XrmToolBox/releases/download/v1.2020.2.37/XrmToolbox.zip'
  checksum64     = '28D9720ABB7682ADD43807107EAF33795A3EDC138A60E88030E2ADD3EEB75C41'
  checksumType64 = 'sha256'
  unzipLocation  = $installDir
}
Install-ChocolateyZipPackage @packageArgs
if ($installDir -ne $toolsPath) { Install-ChocolateyPath $installDir }
