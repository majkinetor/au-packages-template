$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = "$toolsDir\dobi.exe"
  url           = "https://github.com/dnephin/dobi/releases/download/v0.13.0/dobi-windows.exe"  #download URL, HTTPS preferrred
  checksum      = '5B3FD76E8AD1307AECE88EAE1D919B7EDB8E937F4D01EABE56D9B41ABDCD88A2'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs