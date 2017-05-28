$ErrorActionPreference = 'Stop';

$packageName= 'typescript-vs2015'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.3.1-TS-release-dev14update3-20170425.3/TypeScript_Dev14Full.exe'
$checksum   = '96CCD2FA1BD198B19AFF0E629626E2AEE700917996177B6E446CF29E9CBB59DD'
$installVersion = '2.3.1.0'
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