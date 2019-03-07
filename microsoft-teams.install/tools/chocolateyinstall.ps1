$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.4664/Teams_windows.msi'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.4664/Teams_windows_x64.msi'
$checksum32 = 'a144efeefe8637fd652c2cec1e7513e8da51b51178a712ac8972596a5588d4c8'
$checksum64 = 'dbfe0017c6a9f268a6508acbacede61119005ee3f1c01770e6567354faf4b5c6'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'Teams Machine-Wide Installer'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
