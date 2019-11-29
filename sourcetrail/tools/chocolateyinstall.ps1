$ErrorActionPreference = 'Stop';

$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2019.4.61/Sourcetrail_2019_4_61_Windows_32bit_Installer.zip'
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2019.4.61/Sourcetrail_2019_4_61_Windows_64bit_Installer.zip'
    CheckSum = ''
    Checksum64 = ''
    CheckSumType = 'sha512'
    CheckSumType64 = 'sha512'
}

$file = Install-ChocolateyZipPackage @InstallChocolateyZipPackageArgs
$InstallFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'msi'
    SilentArgs = '/qn'
    File = (Get-ChildItem -Path $file -Filter 'sourcetrail.msi' -Recurse).FullName
    ExitCodes = 0
    validExitCodes= @(0)
}
Install-ChocolateyInstallPackage @InstallFileArgs
