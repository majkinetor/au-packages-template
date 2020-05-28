$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.8/SideQuest-Setup-0.10.8-x64-win.exe'
    Checksum64 = '59c44e9c3c28466b54d3847c6b9bf9ba1c6f5ac7f9d073fbccda0cf535ed024761862ce9ea6be0d22f4c3a33a4eeaec8820ae0ac1efd1865790ca1c6c5412412'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
