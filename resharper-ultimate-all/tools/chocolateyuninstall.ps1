$ErrorActionPreference = 'Stop'; # stop on all errors

$platformPackageName = 'resharper-platform'
$packageName = 'ReSharper-Ultimate-All'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$filename = 'JetBrains.ReSharperUltimate.2018.2.EAP5.Checked.exe'
$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename

$silentArgs = '/Silent=True /SpecificProductNamesToRemove=ReSharper;dotTrace;dotMemory;dotCover;dotPeek /VsVersion=* /ReSharper9PlusMsi=True'

$packageParameters = Get-PackageParameters

if ($packageParameters["PerMachine"] -ne $null) {
  $silentArgs += " /PerMachine=True"
}

Uninstall-ChocolateyPackage $packageName 'exe' $silentArgs $installPath
