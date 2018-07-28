$ErrorActionPreference = 'Stop'; # stop on all errors

$platformPackageName = 'resharper-platform'
$packageName = 'ReSharper-Ultimate-All'
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$filename = "JetBrains.ReSharperUltimate.$($env:ChocolateyPackageVersion).exe"
$installPath = Join-Path  (Join-Path $commonPath $platformPackageName) $filename

$silentArgs = "/Silent=True /SpecificProductNames=ReSharper;dotTrace;dotMemory;dotCover;dotPeek /VsVersion=*"

$packageParameters = Get-PackageParameters

if ($packageParameters["PerMachine"] -ne $null) {
  $silentArgs += " /PerMachine=True"
}

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  file          = $installPath
  silentArgs    = $silentArgs
  validExitCodes= @(0)
  softwareName  = 'ReSharper'
}

Install-ChocolateyInstallPackage @packageArgs