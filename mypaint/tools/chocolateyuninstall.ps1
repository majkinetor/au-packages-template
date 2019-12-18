$ErrorActionPreference = 'Stop';

$UninstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    File = Joint-Path $Env:Programfiles "\mypaint-git-w64\uninstall.exe"
    FileType = 'exe'
    SilentArgs = '/S'
}
Uninstall-ChocolateyPackage @UninstallArgs