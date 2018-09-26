
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$((${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0])\SnmpB"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://sourceforge.net/projects/snmpb/files/snmpb/0.8/snmpb-0.8.exe/download'

  softwareName  = 'snmpb*'

  checksum      = '167c107efa1afe441f304b2ad271d2cac0e856675cf45c57d0dadfcdc13a49d2'
  checksumType  = 'sha256'

  silentArgs    = "/S /D=$installDir"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

Install-BinFile -Name snmpb -Path "$installDir\snmpb.exe"
