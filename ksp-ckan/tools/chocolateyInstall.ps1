$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $exePath
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.26.0/ckan.exe'

  checksum      = '3f9c5c3ae16565a625bca5e87d2e29344849f350e99bea503dba2ac71b589a88'
  checksumType  = 'sha256'
}


Get-ChocolateyWebFile @packageArgs

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath $exePath -WorkingDirectory "$toolsDir"
}
