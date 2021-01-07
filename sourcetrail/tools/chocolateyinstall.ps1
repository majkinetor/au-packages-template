$ErrorActionPreference = 'Stop';
$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.4.35/Sourcetrail_2020_4_35_Windows_64bit_Installer.zip'
    Checksum64 = 'f55c875cb9a935f79c95bda02e9f131ddbc1552f16f8c0022a20d44970c20abc860c82b4e2d404fb460914875c02c6fa2bd43ecde8f0f9bf6e051d443a8f6746'
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
