$ErrorActionPreference = 'Stop';

$packageName= 'typescript-vs2015'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.3.3-TS-release-dev14update3-20170519.1/TypeScript_Dev14Full.exe'
$checksum   = 'd022aeed6a01ece3709ff34bd8ced00f178536284c6a1f6a495a7e2268e20266'
$installVersion = '2.3.3.0'
$softwareName = "TypeScript Tools for Microsoft Visual Studio 2015 $installVersion"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  silentArgs   = "/quiet /norestart /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).Install.log`""
  validExitCodes= @(0)

  softwareName  = $softwareName
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
