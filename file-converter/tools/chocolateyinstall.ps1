$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'msi'
    SilentArgs     = '/q'
    URL64          = ''
    URL            = ''
    Checksum64     = ''
    Checksum       = ''
    ChecksumType64 = ''
    ChecksumType   = ''
}

Install-ChocolateyPackage @InstallArgs

