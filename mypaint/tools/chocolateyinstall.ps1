$ErrorActionPreference = 'Stop';
$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    File64 = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'mypaint-w64-installer.exe'
    Checksum64 = ''
    ChecksumType64 = ''
}
Install-ChocolateyPackage @InstallArgs
