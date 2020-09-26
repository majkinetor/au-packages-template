$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.14/SideQuest-Setup-0.10.14-x64-win.exe'
    Checksum64 = ''
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
