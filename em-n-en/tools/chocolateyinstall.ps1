$ErrorActionPreference = 'Stop';

$url = 'https://github.com/CemraJC/em-n-en/releases/download/v1.0.0/Em-n-en.exe'
$checksum = 'be07a49c497d712a912b67b1d41afb1ffe872718b42da83528d091eceee978f1'
$checksumType = 'sha512'
$File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'Em-n-en.exe'
$file = Get-ChocolateyWebFile -PackageName $env:ChocolateyPackageName `
 -FileFullPath $File `
 -Url $url  `
 -CheckSum $checksum `
 -CheckSumType $checksumType
Write-Host "1. Run $File
2. Choose your options – there is one recommended by default
3. Tell it to `"Start on Windows Startup`"
4. Click `"Ok`""
