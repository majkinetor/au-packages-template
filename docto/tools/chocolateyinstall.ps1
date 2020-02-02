$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'docto.exe'
    URL = 'https://github.com/tobya/DocTo/releases/download/V1.2/docto.exe'
    Checksum = 'dc72bb998986400ce37a5f28f8545056179d665052d34ecea90673be64afb1c9b283966f2de87c54adf81819c272a21e0981f784b280e3ecbfe53994ab543981'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
