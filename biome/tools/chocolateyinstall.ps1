$ErrorActionPreference = 'Stop';

$ZipInstallArgs = @{
    PackageName = $env:ChocolateyPackageName 
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Url64 = 'https://github.com/biome-sh/biome/releases/download/bio-0.90.26/bio-0.90.26-x86_64-windows.zip'
    CheckSum64 = '46457597d2beaad35ffc5aeb98cf0394f53ef91d3db826e83a823678171693a0c8869240bca9cc1ec34d2eea790a515bd1968b9618b602b28a95021e9fbe578b'
    CheckSumType64 = 'sha512'
}

Install-ChocolateyZipPackage @ZipInstallArgs
Write-Output "Run 'bio' to get started"
