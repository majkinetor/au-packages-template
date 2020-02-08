$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $exePath
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.27.0/ckan.exe'

  checksum      = 'f608acdfc3b957aad21d959b83e657e4e1ef0ba2de01a51fbd22d53244cd5ea0'
  checksumType  = 'sha256'
}


Get-ChocolateyWebFile @packageArgs

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath $exePath -WorkingDirectory "$toolsDir"
}
