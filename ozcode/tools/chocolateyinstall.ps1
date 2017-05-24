$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$download_dir = "$Env:TEMP\chocolatey\$packageName\$Env:ChocolateyPackageVersion".Replace("chocolatey\chocolatey", "chocolatey")
$fileLocation = ''
$filename = 'OzCode_2.0.0.1029.exe'
$checksum = '10D0A0FBCE9D76A16ECF4BF49353DFC0BD65888E450FE143DA098E12F66A86A6'

# Flag whether we're being invoked by AU module
[bool] $runningAU = (Test-Path Function:\au_GetLatest)

if (-not (Test-Path $download_dir)) {
    New-Item -ItemType Directory $download_dir #| Out-Null
}

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'ozcode*'
  fileType      = 'exe'
  fileFullPath = "$download_dir\$fileName"
  silentArgs    = "" # NSIS  
  validExitCodes= @(0)
  url           = "http://downloads.oz-code.com/files/$filename"
  checksum      = $checksum
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

if (-not $runningAU) {
    Start-Process 'AutoHotkey' "$toolsDir\install.ahk"

    Install-ChocolateyInstallPackage @packageArgs 
}
