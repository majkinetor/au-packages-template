$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com/the-expanse/SideQuest/releases/download/v0.10.11/SideQuest-Setup-0.10.11-x64-win.exe'
    Checksum64 = '55e6addd0a85ff36c47664d622152ce88ad8582f7c2326c8549bf115f59c641cdd4a7eea01c268cb27509e29a8458490d204a157b0dd1cf21105dfe8ecad3bf8'
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
