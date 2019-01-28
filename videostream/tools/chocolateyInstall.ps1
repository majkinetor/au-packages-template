$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url             = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
  url64           = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'

  softwareName  = 'videostream*'

  checksum      = '147d091f2e62278ade8f0d10adc838ab1713f40241449972849f70259e64f912'
  checksum64    = '07317ab6b720f7341452e476dd7d8ff423b6b764d94c1a1cf2f2ac8e179d9440'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = ""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
