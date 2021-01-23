$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileType       = 'msi'
    SilentArgs     = '/q'
    URL64          = 'https://github.com/Tichau/FileConverter/releases/download/v1.2.3/FileConverter-1.2.3-x64-setup.msi'
    URL            = 'https://github.com/Tichau/FileConverter/releases/download/v1.2.3/FileConverter-1.2.3-x86-setup.msi'
    Checksum64     = '651fddb9e4f6250a29a31e7a152217b196ca7642de0e6c9a4b4fd1ef0f83a769bc9c22bd07ef7310b104ee1171c37460be99daf0fd08d2d415d06b8df78d62ee'
    Checksum       = '2d9589361cce85c4877a356bc8d6ee0ac4ff1cb5c5dd4442c48545d932eb8d090aa8d87ea4bba675ac5e9fc350c0f2409b717eae7cd818e263e322d5c4d5907f'
    ChecksumType64 = 'sha512'
    ChecksumType   = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

