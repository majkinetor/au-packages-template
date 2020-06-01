$ErrorActionPreference = 'Stop';

$fileName     = 'OzCode_4.0.0.2842.vsix'
$checksum     = '6f635ea3e53284c05e74841e4d43ce94c3d9311d1b389a3b970fb4b14be3d231'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs
