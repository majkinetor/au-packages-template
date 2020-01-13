$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.8.5/SideQuest-Setup-0.8.5-x64-win.exe'
    Checksum64 = 'f93a7055a28bbb9312d01e29f1b98698ecefcbbf2ab3d25a40ae409dfd803ebf833fb7a1ee119dc530ee3271015b0ed9ec8c28a182451dd5fc13d7b7171b14d1'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
