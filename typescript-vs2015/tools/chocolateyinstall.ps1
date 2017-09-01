$ErrorActionPreference = 'Stop';

$packageName= 'typescript-vs2015'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.5.2-TS-release-dev14update3-20170830.5/TypeScript_Dev14Full.exe'
$checksum   = '811c4cb18d1ebcf9bd927a35f9157d6807d6b69e67a4491ed269d7cfa3fee67b'
$installVersion = '2.5.2.0'
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
