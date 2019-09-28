$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.7.1_100935.exe'
$validExitCodes = @(0)

$checksum = 'd84a00b59491b747b0af0d1b3bb8d90f3b8901be7fa7caf10935a783afc31ef7'
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
