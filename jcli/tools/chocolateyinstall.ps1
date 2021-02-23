$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocolateyInstallZipArguments = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.35/jcli-windows-amd64.zip'
    CheckSum64 = '8069c5a3ac61eb5d78d59409cae08f7e357a07ec35cb40e3289d3e846458f51dc040c2e3117496f66d893e66dee84f4f5871b6b93d437ff8da58c9707ceec600'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ChocolateyInstallZipArguments
