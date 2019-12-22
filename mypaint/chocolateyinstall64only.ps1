$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = ''
    Checksum64 = ''
    ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

