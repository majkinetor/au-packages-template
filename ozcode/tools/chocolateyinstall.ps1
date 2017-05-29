$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$download_dir = "$Env:TEMP\chocolatey\$packageName\$Env:ChocolateyPackageVersion".Replace("chocolatey\chocolatey", "chocolatey")
$fileLocation = ''
$filename = 'OzCode_3.0.0.3893.exe'
$checksum = '7249952b9dbfbdc4ba7d427e1f4a22f481be41fa241255b77eed77a7d951f56e'

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
