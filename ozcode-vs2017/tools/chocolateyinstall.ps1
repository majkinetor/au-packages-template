$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$fileName     = 'OzCode_4.0.0.2540.vsix'
$checksum     = '1b5b72bc379c398267693c3fc711dc4c4c5efb9c23c3f24275b133c58064b031'

$packageArgs = @{
  packageName   = $packageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs