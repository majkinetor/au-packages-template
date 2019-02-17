$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $exePath
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.25.4/ckan.exe'

  checksum      = 'e992982615c6afcfe5f52d9872df22f4a2fadb3bf97c37931393ea767e7c3ffc'
  checksumType  = 'sha256'
}


Get-ChocolateyWebFile @packageArgs

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath $exePath -WorkingDirectory "$toolsDir"
}