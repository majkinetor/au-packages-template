$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/1.3.5-rc/dip-windows'
    Checksum = 'edfba98a891aca14a4849dd7d230166e631510acf404d30bb7e69a08dc8b24b4648be7a376e5559105f2f506dce3bcfe6b7b3592a72b89794a7c05315870ef05'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
