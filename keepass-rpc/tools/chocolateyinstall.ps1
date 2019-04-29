$ErrorActionPreference = 'Stop';

$url           = 'https://github.com/kee-org/keepassrpc/releases/download/v1.9.0/KeePassRPC.plgx'
$checksum      = '4b24fc8e47ca70989a7d948397a4707913484027635ad5f8be7f96794cfe0309'

if (Test-Path env:"ProgramFiles(x86)")
{
  $fileFullPath = ${env:ProgramFiles(x86)}
} else {
  $fileFullPath = $env:ProgramFiles
}

$fileFullPath = [IO.Path]::Combine($fileFullPath, "KeePass Password Safe 2\Plugins\KeePassRPC.plgx")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  FileFullPath   = $fileFullPath
}

Get-ChocolateyWebFile @packageArgs
