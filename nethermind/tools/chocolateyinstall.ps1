$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.34/nethermind-windows-amd64-1.10.34-b8900ba-20210310.zip'
    CheckSum64 = '0af022b68125a000313d4ba6f9403fd1e3bc4e22eaad815ab8d070daf179b6681316ad692cd2ae0ffbdae1886979cb01e19879ed7f6ff647f43ed03dc5610eee'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
