# Should not be necessary unless using an old version of Chocolatey
$file = "$Env:Programfiles\mypaint-git-w64\uninstall.exe"
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -File $file -FileType 'exe' -SilentArgs '/S'
#   [-ValidExitCodes <Object>] `
#   [-IgnoredArguments <Object[]>] [<CommonParameters>]