$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.44/nethermind-windows-amd64-1.10.44-557fe6b-20210316.zip'
    CheckSum64 = '38bd1ef6bc8a5db04bd0f9860c7ea57ecc1a110d02b3f0bc3e93388f6b4e5a6a2b985a55533e2c1a1b059f4dde68a144ade0f2734416dcb06dea22e360f9355e'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
