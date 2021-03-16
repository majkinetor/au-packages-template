$ErrorActionPreference = 'Stop';
$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2021.1.30/Sourcetrail_2021_1_30_Windows_64bit_Installer.zip'
    Checksum64 = 'ef3c43a71c49ec9b01691a48cf4e602e2d3082c92bb502cb8afe60cacc867331325b1817fddf1b1ed2cf17309b043f2cae05c65b8817f9df12cbb99a4eecab5f'
    CheckSumType64 = 'sha512'
}

If (Test-Path Sourcetrail.zip){Remove-Item $ZipFile -Recurse}
$file = Install-ChocolateyZipPackage @InstallChocolateyZipPackageArgs
"$file"

$InstallFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'msi'
    SilentArgs = '/q'
    File = (Get-ChildItem -Path $file -Filter 'sourcetrail.msi' -Recurse).FullName
}

Install-ChocolateyInstallPackage @InstallFileArgs

Remove-Item $ZipFile -Recurse
