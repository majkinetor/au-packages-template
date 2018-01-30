$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$file = Join-Path $toolsDir "SQLServer2017-KB4052987-x64.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'sql-server-2017-cumulative-update*'
  fileType      = 'EXE'
  file          = $file
  silentArgs    = "/q /IAcceptSQLServerLicenseTerms /Action=RemovePatch /AllInstances"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

Uninstall-ChocolateyPackage @packageArgs