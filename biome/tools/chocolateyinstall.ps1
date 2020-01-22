$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = ''
    CheckSum64 = ''
    CheckSumType64 = ''
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'bio' to get started"