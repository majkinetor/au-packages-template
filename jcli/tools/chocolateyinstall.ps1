$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocolateyInstallZipArguments = @{
    PackageName = $env:ChocolateyPackageName
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url = 'https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.30/jcli-windows-386.zip'
    Url64 = 'https://github.com/jenkins-zh/jenkins-cli/releases/download/v0.0.30/jcli-windows-amd64.zip'
    CheckSum = '062dc6707a55d5b9c2937cf9bace8d390902b28254c68407d9abafbebcf932d134a28fbb04561ba8d8caf809aaaf94b1a2d0ebdaa129c24210cfb46f61fd6600'
    CheckSum64 = 'c380683cf5613590d6e91bd8493eb1bf19274be868a93c0ff28024e7f0a4c006009bbdc90cbf8acb67bf5d5a53f1cca9e6c100caf79a67191322beae8f4bb52a'
    CheckSumType = 'sha512'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ChocolateyInstallZipArguments
