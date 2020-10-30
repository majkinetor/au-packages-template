$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.18/SideQuest-Setup-0.10.18-x64-win.exe'
    Checksum64 = 'fbcbea56b262858459f0cea1ae86af40327070fbe731c3fb7e2dc1b4d94d720468883dcd4593a4cde4a98c78fbc18c231210075ecab52b0df8fe1f1d9245eca3'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
