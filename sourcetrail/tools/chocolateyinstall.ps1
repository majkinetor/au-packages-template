$ErrorActionPreference = 'Stop';
$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.2.43/Sourcetrail_2020_2_43_Windows_64bit_Installer.zip'
    Checksum64 = 'c87bea858153ed3ecc9921b71ed8cc24bab73128398517dc236329566839efc50cbe1a7ee0c3a0ca76df1f15a84f9262c584fc02d6ef9b21dda67f30065135e3'
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
