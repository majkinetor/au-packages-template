$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.8.6/SideQuest-Setup-0.8.6-x64-win.exe'
    Checksum64 = '625af38c7d2286680c864b41a2b94e115ee1a7cdebd745d9cf6aa92f164685614f3d58a5f8b118a0c3079aad3ae82c943e6f1e0889365121a79a10a7fb820303'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
