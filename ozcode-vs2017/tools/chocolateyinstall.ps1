$ErrorActionPreference = 'Stop';

$fileName     = 'OzCode_4.0.0.3109.vsix'
$checksum     = 'cf318b0f1cb5d5484251d3d3e1a841506b291db959f26c4b79f3017444a4ada2'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs
