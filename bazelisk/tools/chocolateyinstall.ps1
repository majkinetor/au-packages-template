$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL64 = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.7.5/bazelisk-windows-amd64.exe'
    Checksum64 = '50c52cedf8dfd861150de6cedc97123afe1d9e90b3315fbf6ec73082124dc1cab6676777220e6c2a119a430e9070980b566e31cb0732a4002d1e842927ecff6d'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
