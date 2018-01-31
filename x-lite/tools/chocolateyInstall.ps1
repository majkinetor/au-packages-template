$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName = 'x-lite'
$installerType = 'exe'

$silentArgs = '-s'
$url = 'https://counterpath.s3.amazonaws.com/downloads/X-Lite_5.0.1_86895.exe'
$validExitCodes = @(0)

$checksum = 'E8B100B63975FD225E481763C5CEDE6EE85D12FEA801693B5C4AB901BC06EBDB'
$checksumType = 'sha256'

$ahkScript = "$toolsDir\install.ahk"

Start-Process -FilePath 'AutoHotkey' -ArgumentList $ahkScript -PassThru

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"