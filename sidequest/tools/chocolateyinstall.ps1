$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.15/SideQuest-Setup-0.10.15-x64-win.exe'
    Checksum64 = '2f3b44aa9f82ed469aad145c4249bed406e4a6e8b032771545b0f7091236d0aff2e04e53d19283c5fc305509fbfc3ff42d91f2a1ad5b67bdfa287e464e30d3f0'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
