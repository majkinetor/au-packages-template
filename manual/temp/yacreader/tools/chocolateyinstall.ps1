$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'YACReader*winx86.exe'
$file64Location = Join-Path $toolsDir 'YACReader*winx64.exe'
$url        = 'https://github.com/YACReader/yacreader/releases/download/9.7.1/YACReader-v9.7.1.2009123-winx86-7z.exe'
$url64      = 'https://github.com/YACReader/yacreader/releases/download/9.7.1/YACReader-v9.7.1.2009123-winx64-7z.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64
  file			= $fileLocation
  file64		= $file64Location
  softwareName  = 'YACReader*'
  checksum      = '79194E14076A9660F302D5561F5959A5BC54A33682A8C85C08D0B633ED24F2C2'
  checksumType  = 'sha256'
  checksum64    = '7E8C832618A52E0E355AE40FAA7969D443599F02C47CB2E6E057F4CD725AE59A'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
