$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/1.4.1/dip-windows'
    Checksum = 'db7134d2aef7b0a4d5f8e24df7cfb26904ea65fa23595f58414353bb122069dbe567765bfec766940c93feb908e6cd281b2cad4d7f6283b1d29fd306485cb478'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
