$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName) 'LiteDB.Studio.exe'
    URL = 'https://github.com/mbdavid/LiteDB.Studio/releases/download/v1.0.2/LiteDB.Studio.exe'
    Checksum = '6a2aba9d085c9b81add02a91d045e72d3f47ef3d8cd772564cb49a6796905519c9e8dcd4b3a1186326f0c485bacaf8671e4ec7611c453dd42dee7c145a6020ab'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
