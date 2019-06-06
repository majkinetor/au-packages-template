$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = 'OzCode_4.0.0.822.vsix'
$checksum     = '2bbfd6b9567cee9b8a653aabde4a74986b69115e24f21f342d1259f4cb82cbf3'
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
