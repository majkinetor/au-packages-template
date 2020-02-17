$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/1.3.5/dip-windows'
    Checksum = '1ee7432897088f94b595a105c0688380a83fb4e4c0e8d4425e85ce24cb3691fd0582ea59ea68cd94c2f6e0a665e9f5ebf6bc2b565a542e088792d4f979f92008'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
