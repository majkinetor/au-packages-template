$ErrorActionPreference = 'Stop'; # stop on all errors

$platformPackageName = 'resharper-platform'
$packageName = 'ReSharper-Ultimate-All'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$filename = 'JetBrains.ReSharperUltimate.2019.3.exe'
$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename

$silentArgs = '/Silent=True /SpecificProductNamesToRemove=* /VsVersion=* /ReSharper9PlusMsi=True'

$packageParameters = Get-PackageParameters

if ($packageParameters["PerMachine"] -ne $null) {
  $silentArgs += " /PerMachine=True"
}

Uninstall-ChocolateyPackage $packageName 'exe' $silentArgs $installPath
