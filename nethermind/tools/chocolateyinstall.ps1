$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.24/nethermind-windows-amd64-1.10.24-5a8edd8-20210226.zip'
    CheckSum64 = '09e3e64385a38825f681f62dcea80adad64ef0d0e6cfd05f6acb58740c36bb5e8f41dd35c22637fc7bca66041e6fff967d684a7a481fd76bcf7ec9397af31398'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
