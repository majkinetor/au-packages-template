$ErrorActionPreference = 'Stop';

$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.2.37/Sourcetrail_2020_2_37_Windows_64bit_Installer.zip'
    Checksum64 = '2b330e2d8152c820d104a6a0d51c3aab64a7b11b9f3fe3bf1a5308f1904b8970b1732a7a724faefaca2d2c881b4d8018abbc3eed73ac7684ead76b23f436d56e'
    CheckSumType64 = 'sha512'
}

$file = Install-ChocolateyZipPackage @InstallChocolateyZipPackageArgs

$InstallFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'msi'
    SilentArgs = '/q'
    File = (Get-ChildItem -Path $file -Filter 'sourcetrail.msi' -Recurse).FullName
}

Install-ChocolateyInstallPackage @InstallFileArgs
