$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubens_v0.9.3_windows_x86_64.zip'
    CheckSum64 = 'bcacdd3d2d7cf1f733c4fb705718561fc0e2aef93d3ea15ef665af0d70cf24018e57abc349959c3bcc5d57c98040cfffbb4b7f0937bb0d697ed558c7c484bc1c'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
