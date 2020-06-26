$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    URL = 'https://github.com/tobya/DocTo/releases/download/V1.3/docto.zip'
    UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)
    Checksum = '1bc5ad1da8a405d8b447ebf7a0cff01c63faa7b882ec0d605214770a12a85d25f0c1cc280e9a5bf6e593665cc2c786fede7714c879683f10c63ef32af8132bfd'
    ChecksumType = 'sha512'
}



Install-ChocolateyZipPackage @InstallArgs
