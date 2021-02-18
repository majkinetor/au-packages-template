$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.22/nethermind-windows-amd64-1.10.22-75f43f0-20210217.zip'
    CheckSum64 = '902d70c1530b66ce5d39cf118775f258af0f9b74aa0c3370bd75b56923bca9379a61d461c65b55dc9aae883ec65ab816a94107a3878a5417944df7ecd0a1e4cb'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
