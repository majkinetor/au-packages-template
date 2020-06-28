$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'informado.exe'
    URL = 'https://github.com/030/informado/releases/download/1.3.0/informado-windows'
    Checksum = '7fc51f7775452b636fd1da49a506953235010644543957da3e7bc6856a728c809a0d33baad6ee34a7564ef6aba0bd6cd914d0f8e778b85e9d7c02cbfc027fee3'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
