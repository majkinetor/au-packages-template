$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/NethermindEth/nethermind/releases/download/1.10.27/nethermind-windows-amd64-1.10.27-26b6754-20210303.zip'
    CheckSum64 = 'cdbc6baac990d86aea74f39b77f0864b911210e3cd588bc2eb8223f4e21fe5d18c7ff764472d2ead6c5e54bf272e77b04fd55ca3bfd203891f19f7a706523941'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
