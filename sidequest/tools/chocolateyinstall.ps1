$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.8.7/SideQuest-Setup-0.8.7-x64-win.exe'
    Checksum64 = '60537ceaaac95c8653038747ade0564d284127dcba09cee0307bf2c5c4674d31e21229128b79c8e55bc816f3245484a82db26b5c47f823909a35c4f30e3fa688'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
