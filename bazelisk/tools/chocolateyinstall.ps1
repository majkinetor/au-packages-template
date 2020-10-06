$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.6.1/bazelisk-windows-amd64.exe'
    Checksum = ''
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
