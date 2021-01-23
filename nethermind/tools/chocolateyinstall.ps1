$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/biome-sh/biome/releases/download/bio-1.5.75/bio-1.5.75-x86_64-windows.zip'
    CheckSum64 = 'da00eb524d253f42fac1adbf271f4cac5c9d61f6f20a3be97f3b441618dc13cd2a6999cb0e5a153f664929989a3ec8a7bf4d153bd2d75ab338fb2d124ce6284c'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'Nethermind.Launcher.exe' and select the desired configuration to get started"
