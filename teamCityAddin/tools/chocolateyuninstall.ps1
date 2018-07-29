$platformPackageName = 'resharper-platform'
$packageName = 'teamCityAddin'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$filename = 'JetBrains.ReSharperUltimate.2018.1.3.exe'

$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename
Uninstall-ChocolateyPackage $packageName 'exe' '/Silent=True /SpecificProductNamesToRemove=teamCityAddin /VsVersion=*' $installPath
