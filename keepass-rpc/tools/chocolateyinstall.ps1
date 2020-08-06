$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url           = 'https://github.com/kee-org/keepassrpc/releases/download/v1.13.0/KeePassRPC.plgx'
$checksum      = 'a2ec4c388ba33265136a034b328e0ecef5e4f3c0c33596f4bef43349920a4c87'

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
