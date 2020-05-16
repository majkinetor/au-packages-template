$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url             = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
  url64           = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'

  softwareName  = 'videostream*'

  checksum      = '3fa1d4fadd7feda41610b5ba5611d23daed54a45d1e15b3a049df4c38c02614c'
  checksum64    = 'b39ae255ed1d2ccfdc3ab04362322110d53ef2ead6db2272d4c2810604692f3a'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = ""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
