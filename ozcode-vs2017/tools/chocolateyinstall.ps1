$ErrorActionPreference = 'Stop';

$fileName     = 'OzCode_4.0.0.2613.vsix'
$checksum     = ''

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs
