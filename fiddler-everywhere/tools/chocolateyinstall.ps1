$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'exe'
    SilentArgs     = '/S'
    URL            = 'https://downloads.getfiddler.com/win/Fiddler%20Everywhere%201.0.2.exe'
    Checksum       = '50b5bdd4f6bfc935f61b280b163cc1d29484c2bda9162520489003bc19e5e5a00b9562817ec7faa36e36bde259883b614b8838e349f91eabdb5a4a5803a99405'
    ChecksumType   = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

