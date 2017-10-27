$ErrorActionPreference = 'Stop';

if (Test-Path env:"ProgramFiles(x86)")
{
  $fileFullPath = ${env:ProgramFiles(x86)}
} else {
  $fileFullPath = $env:ProgramFiles
}

$fileFullPath = [IO.Path]::Combine($fileFullPath, "KeePass Password Safe 2\Plugins\KeePassRPC.plgx")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = "https://github.com/kee-org/keepassrpc/releases/download/v1.7.3.1/KeePassRPC.plgx"
  checksum      = '3355834E4CE9D09D58E3F19F60505B0B06332FCE1F63B5EE908A1DF170192BF9'
  checksumType  = 'sha256'
  FileFullPath   = $fileFullPath
}

Get-ChocolateyWebFile @packageArgs