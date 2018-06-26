$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.3.2_92627.exe'
$validExitCodes = @(0)

$checksum = '4389196166d878c5e07ad5cd17f05cbb367def92730b3afd921acb6767d6e5d6'
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
