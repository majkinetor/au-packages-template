$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'informado.exe'
    URL = 'https://github.com/030/informado/releases/download/2.0.0/informado-windows'
    Checksum = '08847c596c6ce780fd861a3df22ae1fdef0a2ac34b5e9b8a6b9b0d917693f3f0c252d5cf046e54155a94e988e2ec9c391459a033210d35304be4358306d43ee1'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
