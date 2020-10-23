$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL64 = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.7.4/bazelisk-windows-amd64.exe'
    Checksum64 = '6a43af2df03a498c31152157cfb0cebf07607b71052dc07eb426378a47dc3713477fa270cbf6b219d87430edbe0dcb15b182c56a3e57e6eabc9ecdcdb4a8a066'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
