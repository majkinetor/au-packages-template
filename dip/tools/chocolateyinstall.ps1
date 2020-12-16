$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/2.0.2/dip-windows'
    Checksum = '5f5336acf6baa44ae2e1f426036254d505db96b4d2052f0e532e5360e5841c2fbd04a883e66b18431f5d8a09de736d4fddf45f2553aec19a5601e5e1f0d8d99e'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
