$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.5.0_97566.exe'
$validExitCodes = @(0)

$checksum = '26a265eef9ea8d56a097b30f812762cd76d60d5c81f450dfcbe7fee1fea73f3f'
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
