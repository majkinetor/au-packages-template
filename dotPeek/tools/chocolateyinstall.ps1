$ErrorActionPreference = 'Stop'; # stop on all errors

$filename = 'JetBrains.ReSharperUltimate.2019.2.3.exe'

$platformPackageName = 'resharper-platform'

$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $installPath
  silentArgs    = "/Silent=True /SpecificProductNames=$($env:ChocolateyPackageName) /VsVersion=*"
  validExitCodes= @(0)
  softwareName  = $env:ChocolateyPackageName
}
Install-ChocolateyInstallPackage @packageArgs
