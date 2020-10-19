$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.17/SideQuest-Setup-0.10.17-x64-win.exe'
    Checksum64 = 'ea8442884e257d60512865ce62fa3a975c268462f8c4bc156b1c973b1257b2f46bf95953d290db9d58a3e36d0ad1e8f115a781daf6d22cad1d4cbddea248e76c'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
