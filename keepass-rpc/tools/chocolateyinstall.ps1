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
  url           = "https://github.com/kee-org/keepassrpc/releases/download/v1.8.0/KeePassRPC.plgx"
  checksum      = '8D9D5E390FC4A3B8D6D8F24DD26A712DC032C4FF49708C8EC32C95A2E27594B5'
  checksumType  = 'sha256'
  FileFullPath   = $fileFullPath
}

Get-ChocolateyWebFile @packageArgs