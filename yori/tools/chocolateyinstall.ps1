$ErrorActionPreference = 'Stop';
$installDir = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = $installDir
    URL = 'http://malsmith.net/download?obj=yori/1.40/win32/ysetup.exe'
    Checksum = '2eab6fa63605d73aac3c46cc0f1783504e74731fbb4dd322cafb11ef17233ce9'
    ChecksumType = 'sha256'
}

Install-ChocolateyPackage @InstallArgs


$files = get-childitem $installDir -include *.exe -recurse | Where-Object -FilterScript {$_.Name -ne "yori.exe"}

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}
