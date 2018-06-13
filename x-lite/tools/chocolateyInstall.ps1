$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.1.0_89322.exe'
$validExitCodes = @(0)

$checksum = '0FBD8264F1405378AC1F12AE2EF02538BB9272BB777FA742163E8F969EE66180'
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