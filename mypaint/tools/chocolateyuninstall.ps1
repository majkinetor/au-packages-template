$bit = (Get-WMIObject Win32_Processor).AddressWidth | Select-Object -First 1
$file = "$Env:Programfiles\mypaint-git-w$bit\uninstall.exe"
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -File $file -FileType 'exe' -SilentArgs '/S'