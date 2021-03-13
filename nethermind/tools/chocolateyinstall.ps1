$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.41/nethermind-windows-amd64-1.10.41-d9db1e4-20210313.zip'
    CheckSum64 = 'f1fc2bb7132364d334a04a36a4fd1bd42f7802b865feceb2e0d81581894d3ff415bdcba96b6aa42678290ff49bb8d2b30cb725b1dbfa8e120fe4abc5c183850b'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
