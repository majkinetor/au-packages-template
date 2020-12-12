$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/2.0.1/dip-windows'
    Checksum = '711254807ffa7986234b9a9139c9ddc58ac11d524f7ac210026b3b4229b79503a91b8a5b35e6a812f96512beeac6d664e00dfc14d13896b16a3c77aa4d4736f9'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
