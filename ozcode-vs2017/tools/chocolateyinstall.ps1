$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = 'OzCode_3.0.0.3597_FOR_VS2017.vsix'
$checksum     = '3a493231fa4040ad90f5384ad8f86af19a39f5f8b4ddbfb2332a970cd97669ff'
$fileFullPath = "$toolsDir\$fileName"

# Flag whether we're being invoked by AU module
[bool] $runningAU = (Test-Path Function:\au_GetLatest)

if (-not $runningAU) {
. $toolsDir\common.ps1
}

$packageArgs = @{
  packageName   = $packageName
  fileFullPath  = $fileFullPath
  url           = "http://downloads.oz-code.com/files/$fileName"  #download URL, HTTPS preferrred
  checksum      = $checksum
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

if (-not $runningAU) {
    & $vsixInstaller $fileFullPath /instanceIds:$vsInstances /logfile:`"$env:TEMP\$($packageName)\$($packageName).VsixInstall.log`" /quiet
}
