$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocolateyInstallZipArguments = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.32/jcli-windows-amd64.zip'
    CheckSum64 = '67a7bdc072dd85ba26f894e624a7dcb14f349c46789ea654e6bb05bb2a648fd4d7e6252b8958792edf3c17832f8baeae369391c006e347840f8ecfcf718b88dd'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ChocolateyInstallZipArguments
