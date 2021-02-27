$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/ahmetb/kubectx/releases/download/v0.9.3/kubectx_v0.9.3_windows_x86_64.zip'
    CheckSum64 = '0e745a5cc85b023cc0cd754bb762283faa4be1261e61b9ce2b94f32cfcbab439b79b679c73ac5ebcc3efb5c8b01006bb63f60c62528af8b5d2ef728aa43593a4'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
