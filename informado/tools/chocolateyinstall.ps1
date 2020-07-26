$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'informado.exe'
    URL = 'https://github.com/030/informado/releases/download/1.4.0/informado-windows'
    Checksum = '96c98a740e527712a0ee2276ab414a2e844611d5b52e233913213ec4eb88f9598beb29fa29720779a0cd811b946e5e7b1fe5e349033fa60c82425a67854ae197'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
