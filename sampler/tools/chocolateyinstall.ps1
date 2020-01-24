$ErrorActionPreference = 'Stop';

$GetChocoWebFileArgs = @{
    PackageName    = $env:ChocolateyPackageName
    FileFullPath   = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'sampler.exe'
    Url64bit       = ''
    CheckSum64     = ''
    CheckSumType64 = ''
}

Get-ChocolateyWebFile @GetChocoWebFileArgs
