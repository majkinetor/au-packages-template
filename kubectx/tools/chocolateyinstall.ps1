$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.2/kubectx_v0.9.2_windows_x86_64.zip'
    CheckSum64 = '51e40866db2eb9a49c2f52aa8d26a63913ff1cf3621372cd8fab08d1dd3d89e4ce19c2ab529ea4b778218e537bfc9dafcfc4e69d73ff9d9ae3f5d7717e3cffad'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
