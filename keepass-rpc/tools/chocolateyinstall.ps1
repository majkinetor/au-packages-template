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
  url           = "https://github.com/kee-org/keepassrpc/releases/download/v1.7.2/KeePassRPC.plgx"
  checksum      = '5196D04D1E395FA51EC535EF213F22128156811F8FCE079C89974D0845FF60A8'
  checksumType  = 'sha256'
  FileFullPath   = $fileFullPath
}

Get-ChocolateyWebFile @packageArgs