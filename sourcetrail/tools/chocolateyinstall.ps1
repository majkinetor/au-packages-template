$ErrorActionPreference = 'Stop';

$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.1.117/Sourcetrail_2020_1_117_Windows_64bit_Installer.zip'
    Checksum64 = 'f8804fc74a1c80aa4f23384a9172555b734ef59761e3fda46e208a1cfdae6ceccb064f25f1a78ec84eea9431d0c02fb765d01a861d17fddd42d4b3f9088f2650'
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
