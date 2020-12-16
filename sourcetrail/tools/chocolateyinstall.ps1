$ErrorActionPreference = 'Stop';
$ZipFile = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Sourcetrail.zip'
$InstallChocolateyZipPackageArgs = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = $ZipFile
    Url64Bit = 'https://github.com/CoatiSoftware/Sourcetrail/releases/download/2020.4.32/Sourcetrail_2020_4_32_Windows_64bit_Installer.zip'
    Checksum64 = 'de4a0ee229682c3ed852c153df541c664b9c20b1dd8803326bb1ddb14f6db2e0be9edf8701c130213d2a4d51ff878867f92d0170defffdaa69240790a12a6866'
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
