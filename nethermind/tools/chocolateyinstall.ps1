$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.46/nethermind-windows-amd64-1.10.46-0e01637-20210318.zip'
    CheckSum64 = 'd2fe318862b89f21ef107cc1bbaeb15f5f1ae2a2164647f73c967e189d268823d58631f33a120dde165d1365368c292551a518d44eaeae429bbc6af2a61bb9e0'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
