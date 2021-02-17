$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.19/SideQuest-Setup-0.10.19-x64-win.exe'
    Checksum64 = '48fd9a028d74ad0ec2996d7f92b017eafb48fdd2f6dd053cd56d5254379fe3314869eb6cbdce2592b51e1f2c8efe961a89b9d44be942af5320d43eed2b87962d'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
