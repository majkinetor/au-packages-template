$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$download_dir = "$Env:TEMP\chocolatey\$packageName\$Env:ChocolateyPackageVersion".Replace("chocolatey\chocolatey", "chocolatey")
$fileLocation = ''
$filename = 'OzCode_3.1.0.3913.exe'
$checksum = 'b9ec99e041d65ed4dd44a1bf9d3fa09bb3561936dc1add90e55403afdb86c4f9'

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
