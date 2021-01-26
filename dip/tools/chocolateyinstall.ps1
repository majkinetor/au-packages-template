$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/2.1.2/dip-windows'
    Checksum = 'c9e118f7699fd11fea1864b87a0502981223f6bea7a0a0d13e2a90843abfa7b6778cafedcc496829aeaed4aea8e267233b80001f3c850592980e05956171f33b'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
