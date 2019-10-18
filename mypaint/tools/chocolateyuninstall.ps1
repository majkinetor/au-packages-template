# Should not be necessary unless using an old version of Chocolatey
$bit = (Get-WMIObject Win32_Processor).AddressWidth | Select-Object -First 1
$file = "$Env:Programfiles\mypaint-git-w$bit\uninstall.exe"
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -File $file -FileType 'exe' -SilentArgs '/S'
#   [-ValidExitCodes <Object>] `
#   [-IgnoredArguments <Object[]>] [<CommonParameters>]