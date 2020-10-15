$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.16/SideQuest-Setup-0.10.16-x64-win.exe'
    Checksum64 = 'b3bf1419c8d6054f239b49a8d9543d46e95115a675c0329255f562ce4bb6660e065ae06d386bfcbb3eee016d67a81c4dfaa340a8b3ab3c7b78bc7ad567acb980'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
