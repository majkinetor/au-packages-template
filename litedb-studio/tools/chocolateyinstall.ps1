$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName) 'LiteDB.Studio.exe'
    URL = 'https://github.com/mbdavid/LiteDB.Studio/releases/download/v0.5.2/LiteDB.Studio.exe'
    Checksum = '71601d53503a742b2bd13b89ce4297e08a55d251b3047ba83394099db50b98f0065ac17185d09f2a48dfd5495dff0cf7846130bf3fc3b355e57b44decc83ae79'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
