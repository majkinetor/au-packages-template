$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/SideQuestVR/SideQuest/releases/download/v0.10.14/SideQuest-Setup-0.10.14-x64-win.exe'
    Checksum64 = '8344321a5c2ad47601ff19504011e08656a5b146e23becfade3a2a3e81dcdcc5c188483cad234b5965959c7d81af1a4cbd730dd49a776fd91cfd9583124019e7'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
