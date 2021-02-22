$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.23/nethermind-windows-amd64-1.10.23-a2cba41-20210222.zip'
    CheckSum64 = 'f7e33207aaa43b9dd0c163043c2f5d8621d6aee97b274f1abe97bafa396bbffb64e71446c351a5c4f5abe8bf4ea7e3f9b01c20e655b6f0eedb7aa9c05371dee6'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
