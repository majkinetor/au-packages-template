$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName) 'LiteDB.Studio.exe'
    URL = 'https://github.com/mbdavid/LiteDB.Studio/releases/download/v1.0.1/LiteDB.Studio.exe'
    Checksum = '29460002837dde57eda6e6f995ca9c9722e729149d3e0c615c8d4297b51af4cc501e15e2d6a21e22dd105dabfde8273a9f892ed6ad0bbfdcd1952b9067b90a21'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
