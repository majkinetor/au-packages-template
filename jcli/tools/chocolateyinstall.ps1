$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocolateyInstallZipArguments = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url = 'https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.31/jcli-windows-amd64.zip'
    CheckSum = 'e090a41a40a5440411fe7c7bba7ff4ff7028623eeccb903a321cc2d42237274b55c839f20e4971a31cb6da29a60b38deb68c35be7efaa122c247b263214a5277'
    CheckSumType = 'sha512'
}

Install-ChocolateyZipPackage @ChocolateyInstallZipArguments
