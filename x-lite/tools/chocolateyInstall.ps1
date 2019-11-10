$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.8.0_101919.exe'
$validExitCodes = @(0)

$checksum = '4f9095404de37c89b8cec6cc098b1cf8807b681c7167abe8e83a86aa5f95ef67'
$checksumType = 'sha256'

$ahkScript = "$toolsDir\install.ahk"

[bool] $runningAU = (Test-Path Function:\au_GetLatest)

if (-not $runningAU) {
    Start-Process -FilePath 'AutoHotkey' -ArgumentList $ahkScript -PassThru
}

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"
