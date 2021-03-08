$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.31/nethermind-windows-amd64-1.10.31-f2d79a6-20210307.zip'
    CheckSum64 = '8a90e80d05b8ab0f56a7b02c4c88708174937510e83d32fbda6b2e8482c212bdfa3271ae980787ee5650592382d32ca861869feb18d775b4ec06cf72c545aa69'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
