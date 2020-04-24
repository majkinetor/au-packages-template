$ErrorActionPreference = 'Stop';

$fileName     = 'OzCode_4.0.0.2637.vsix'
$checksum     = '490719260ff56b08d6262bda0794ec3737edf2146660baf08751063525844002'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://downloads.oz-code.com/files/$fileName"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-VisualStudioVsixExtension @packageArgs
