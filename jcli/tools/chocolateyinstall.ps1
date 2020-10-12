$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocolateyInstallZipArguments = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url = ''
    Url64 = ''
    CheckSum = ''
    CheckSum64 = ''
    CheckSumType = ''
    CheckSumType64 = ''
}

Install-ChocolateyZipPackage @ChocolateyInstallZipArguments
