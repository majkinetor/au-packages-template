$ErrorActionPreference = 'Stop'; # stop on all errors

$filename = 'JetBrains.ReSharperUltimate.2018.1.exe'

$platformPackageName = 'resharper-platform'
$packageName = 'ReSharper'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename
Uninstall-ChocolateyPackage $packageName 'exe' '/Silent=True /SpecificProductNamesToRemove=ReSharper /VsVersion=*' $installPath
