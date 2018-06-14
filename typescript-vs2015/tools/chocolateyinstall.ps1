$ErrorActionPreference = 'Stop';

$packageName= 'typescript-vs2015'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.9.2-TS-release-dev14update3-20180612.2/TypeScript_Dev14Full.exe'
$checksum   = '52cf2a43dc4bc9aca0126b7ba444a6d41bf4c87e59385f622ba77044aa3d4e6a'
$installVersion = '2.9.2.0'
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
