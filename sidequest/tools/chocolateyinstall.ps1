$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.10/SideQuest-Setup-0.10.10-x64-win.exe'
    Checksum64 = '7efab592d5a712c6377d20069284a0414a9a800417f7516ff08eb4703df72f413ad93eba087f6cbfaa1e9b66edfba9510ca16aa93a116bb2548d6d857af7de6f'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
