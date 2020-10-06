$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL64 = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.7.1/bazelisk-windows-amd64.exe'
    Checksum64 = '8749b00785bd79e1ca001df50aa68cf014b4a4564c8b3024e1836e9163ddb9f1d5277bbf5872f7c4cc39d867a08e140e6c9d002c57d41ef281fcfd0626634af8'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
