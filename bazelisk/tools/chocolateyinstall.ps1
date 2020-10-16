$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL64 = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.7.2/bazelisk-windows-amd64.exe'
    Checksum64 = 'b851db105fa32785b64eca2e8d10c326d770b800bce997f1949cfffef06626b8d389f135e016df12165335eb6c08cabbc75cb6c041fad690be13cf31587b5afc'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
