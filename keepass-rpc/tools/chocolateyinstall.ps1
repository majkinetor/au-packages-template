$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url           = 'https://github.com/kee-org/keepassrpc/releases/download/v1.11.0/KeePassRPC.plgx'
$checksum      = 'a48b30a1864ce90717a6173cd7b681e1eebe9e15921932e962037aeac7236584'

$packagePath = $(Split-Path -parent $toolsDir)
$downloadPath = Join-Path $packagePath "KeePassRPC.plgx"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  FileFullPath   = $downloadPath
}

Get-ChocolateyWebFile @packageArgs

# Now copy the plugin into the KeePass plugins directory
if (Test-Path env:"ProgramFiles(x86)")
{
  $fileFullPath = ${env:ProgramFiles(x86)}
} else {
  $fileFullPath = $env:ProgramFiles
}

$fileFullPath = [IO.Path]::Combine($fileFullPath, "KeePass Password Safe 2\Plugins\")

if (-not (Test-Path $fileFullPath)) {
  New-Item -ItemType Directory $fileFullPath | Out-Null
}

Copy-Item -Path $downloadPath -Destination $fileFullPath -Force
