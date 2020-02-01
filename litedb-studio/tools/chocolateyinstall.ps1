$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName) 'LiteDB.Studio.exe'
    URL = 'https://github.com/mbdavid/LiteDB.Studio/releases/download/v1.0.0/LiteDB.Studio.exe'
    Checksum = '24f46dcd2c1f39892d902dce3d2f427be96d09f51126e63eca47069f2b4bfaccb9a05cd850920ebc63cebbdf6fe92f26d2c4650e97fea93a45e25bc36b9daf35'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
