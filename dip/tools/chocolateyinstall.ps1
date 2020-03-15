$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'dip.exe'
    URL = 'https://github.com/030/dip/releases/download/1.4.0/dip-windows'
    Checksum = '845c9814da40f80768b2b33f03e4571749383de98a31226c5144f93484d2460bba82741b9cd112179a826e1659fb2f02e937195681f8aa6c4aebeee18161edb0'
    ChecksumType = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
