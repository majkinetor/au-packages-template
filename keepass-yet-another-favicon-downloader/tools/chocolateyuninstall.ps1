$ErrorActionPreference = 'Stop';

if (Test-Path env:"ProgramFiles(x86)")
{
  $fileFullPath = ${env:ProgramFiles(x86)}
} else {
  $fileFullPath = $env:ProgramFiles
}

$fileFullPath = [IO.Path]::Combine($fileFullPath, "KeePass Password Safe 2\Plugins\YetAnotherFaviconDownloader.plgx")

if (Test-Path $fileFullPath) {
  Remove-Item $fileFullPath -Force
}