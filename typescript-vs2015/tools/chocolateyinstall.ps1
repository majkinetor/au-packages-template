$ErrorActionPreference = 'Stop';

$packageName= 'typescript-vs2015'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.4.0-TS-release-dev14update3-20170608.3/TypeScript_Dev14Full.exe'
$checksum   = '2e225f1d5bd6f8158f7294b4fcf9676d5d67610406d6c051dbfc011589cd4bf5'
$installVersion = '2.4.0.0 RC'
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
