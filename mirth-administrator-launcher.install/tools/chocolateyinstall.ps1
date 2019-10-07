$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Mirth Connect Administrator Launcher *'
  fileType      = 'exe'
  silentArgs    = "-q -console"
  
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://s3.amazonaws.com/downloads.mirthcorp.com/connect-client-launcher/mirth-administrator-launcher-1.1.0-windows.exe"  #download URL, HTTPS preferrred
  checksum      = 'E4ADAC3FA8B96BD37C42C774640A0F5784E97597399E863583F8FF68219A3A4A'
  checksumType  = 'sha256'
  url64bit      = "https://s3.amazonaws.com/downloads.mirthcorp.com/connect-client-launcher/mirth-administrator-launcher-1.1.0-windows-x64.exe"   # 64bit URL here (HTTPS preferred) or remove - if installer contains both architectures (very rare), use $url
  checksum64    = '9C00CF2C64284DD146AED0B71C4D032A821EE2B62D9868C6B740927C49CCC38B'
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
