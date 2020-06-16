$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.9/SideQuest-Setup-0.10.9-x64-win.exe'
    Checksum64 = 'fcb4f916ce870fbfd04d555d418c9bcb6506d368821279be5d3be4ac247d27b7288fb0160b962e0c489ee98c682e8797a1eeae2062cd08a733e9e94eab5f50d8'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
