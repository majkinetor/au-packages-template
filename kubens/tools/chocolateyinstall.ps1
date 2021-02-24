$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.2/kubens_v0.9.2_windows_x86_64.zip'
    CheckSum64 = 'e5506aeff475c9134ab4cb6450c8216b4a52df24ab29c4c92dbbfc8ed5b1274bc86dcc387fd598401da57e3aedc309444db24a1b78ebd2ef9d24407074bab9ae'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
