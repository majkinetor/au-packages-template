$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.37/nethermind-windows-amd64-1.10.37-068e5c3-20210310.zip'
    CheckSum64 = '5b2ba1808b6dd9af3de086170ae3c3e2f98430ffce6df05af315121c3d5cd253c21ccf55167f1d699681978e0add6fc6f65f1d2669ee54c5390fde06e59645cd'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
