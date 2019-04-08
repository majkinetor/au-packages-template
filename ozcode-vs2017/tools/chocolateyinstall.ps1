$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = 'OzCode_4.0.0.557.vsix'
$checksum     = '8fa72cda889746da555b2f3d9981676e53879460de36f49c8e4a4f09fe41ba17'
$fileFullPath = "$toolsDir\$fileName"

# Flag whether we're being invoked by AU module
[bool] $runningAU = (Test-Path Function:\au_GetLatest)

if (-not $runningAU) {
. $toolsDir\common.ps1
} else {
    # We don't want this file being put in the tools directory when running in AU
    $fileFullPath = "$ENV:Temp\$filename"
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
