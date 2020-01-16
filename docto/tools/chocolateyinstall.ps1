$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'docto.exe'
    URL = 'https://github.com/tobya/DocTo/releases/download/v1.1.24/docto.exe'
    Checksum = '806204789ed9faf07971dd6915e0a9c7d57034376a427c56c4587b54502893753cb73600ecdb9e9af3c58fea71c435a864d47ed1f70306f32069e3363b389015'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
