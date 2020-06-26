$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'n3dr.exe'
    URL = 'https://github.com/030/n3dr/releases/download/3.6.1/n3dr-windows'
    Checksum = 'f01b0a6930bedcdee2e17cd084c9d4f04a6b40c70e3f1b130bbebf6d3e84fa2ea8ea1893ede03e90e80b54ba42103bbb8dde0a90e98912b4b140441e46575a51'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
