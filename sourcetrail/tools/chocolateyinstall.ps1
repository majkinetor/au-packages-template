$ErrorActionPreference = 'Stop';

$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2019.4.102/Sourcetrail_2019_4_102_Windows_64bit_Installer.zip'
    Checksum64 = '83da05aca615e71afbbe34a53f378ae79e8db3a13ec9f53059bcf7bcb6177fba2a52048a76bb26b9a75916ac75a11441828183a5fce33c7bb701d237df16995a'
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
