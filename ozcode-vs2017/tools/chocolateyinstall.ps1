$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = "OzCode_3.0.0.3597_FOR_VS2017.vsix"
$fileFullPath = "$toolsDir\$fileName"

. $toolsDir\common.ps1

$packageArgs = @{
  packageName   = $packageName
  fileFullPath = $fileFullPath
  url           = "http://downloads.oz-code.com/files/$fileName"  #download URL, HTTPS preferrred
  checksum      = '3A493231FA4040AD90F5384AD8F86AF19A39F5F8B4DDBFB2332A970CD97669FF'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

& $vsixInstaller $fileFullPath /instanceIds:$vsInstances /logfile:`"$env:TEMP\$($packageName)\$($packageName).VsixInstall.log`" /quiet