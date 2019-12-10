$ErrorActionPreference = 'Stop';

$Version = ''
$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    File = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "mypaint-git-w32-$Version-installer.exe"
    Checksum = ''
    ChecksumType = 'sha512'
    File64 = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) "mypaint-git-w64-$Version-installer.exe"
    Checksum64 = ''
    ChecksumType64 = 'sha512'
}

$files = Get-ChildItem (Join-Path $env:ChocolateyInstall (Join-Path (Join-Path 'lib' $env:ChocolateyPackageName) 'tools')) -include *.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

Install-ChocolateyPackage @InstallArgs

