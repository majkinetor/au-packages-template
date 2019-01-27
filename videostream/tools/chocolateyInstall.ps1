$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url             = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
  url64           = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'

  softwareName  = 'videostream*'

  checksum      = '147D091F2E62278ADE8F0D10ADC838AB1713F40241449972849F70259E64F912'
  checksum64    = '07317AB6B720F7341452E476DD7D8FF423B6B764D94C1A1CF2F2AC8E179D9440'
  checksumType  = 'sha256'

  silentArgs    = ""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
