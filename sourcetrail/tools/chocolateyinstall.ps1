$ErrorActionPreference = 'Stop';

$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.1.106/Sourcetrail_2020_1_106_Windows_64bit_Installer.zip'
    Checksum64 = '5678582c865a123ed31b0087d0a695bbe011c262ed924378be0ecbb0752c684a0db0ff0648e9489213e606465cf2f4457da87d39e42ba06469ecc0f2cf61d074'
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
