$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.7/SideQuest-Setup-0.10.7-x64-win.exe'
    Checksum64 = '85922ec1c709a59c95bdb9a15c9cfaffc66c51cc426984f425bf4e74696dbb4eed9208992a60151ab065d6d0d681046aa2cdb730ad5a54c5f3db8e5124277b14'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
