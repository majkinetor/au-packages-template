$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = 'OzCode_4.0.0.609.vsix'
$checksum     = '49578a4df4d7d35a5d80462d0292ea53e3be802f48c6668ccad9df56134c8e0d'
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
