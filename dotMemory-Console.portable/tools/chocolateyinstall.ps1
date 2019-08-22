$ErrorActionPreference = 'Stop'; # stop on all errors

$url = 'https://download-cf.jetbrains.com/resharper/ReSharperUltimate.2019.2.1/JetBrains.dotMemoryConsole.2019.2.1.zip'
$checksum = '8f5368cda7d48ef2b097a601622f76e9e3c9355f056299813f5cc2122d9f46f1'

$installPath  = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  UnzipLocation = $installPath
  checksum      = $checksum
  ChecksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs