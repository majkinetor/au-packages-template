$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = ''
    URL = ''
    Checksum64 = ''
    Checksum = ''
    ChecksumType64 = 'sha512'
    ChecksumType = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

