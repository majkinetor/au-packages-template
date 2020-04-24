$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.3/SideQuest-Setup-0.10.3-x64-win.exe'
    Checksum64 = '203aacb75ef77b689888915b1553a22ec9d310eb11b6fe2fccc3c9fd3b7261fd4717630352893afcaa6e272d141fb2860a8bb5501a5b80e044c8e13c91233cf4'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
