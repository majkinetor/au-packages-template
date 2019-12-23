$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com//mypaint/mypaint/releases/download/v2.0.0-beta.0/mypaint-git-w64-2.0.0-alpha-v2.0.0-beta.0.591-installer.exe'
    URL = 'https://github.com//mypaint/mypaint/releases/download/v2.0.0-beta.0/mypaint-git-w32-2.0.0-alpha-v2.0.0-beta.0.591-installer.exe'
    Checksum64 = ''
    Checksum = ''
    ChecksumType64 = 'sha512'
    ChecksumType = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

