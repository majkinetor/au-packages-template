$ErrorActionPreference = 'Stop';

$fileName     = 'OzCode_4.0.0.2721.vsix'
$checksum     = '6ec34cca7cfe309f1726133ca8feaab11a152b9e2cdbe85fbabe8a314a5cc753'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs
