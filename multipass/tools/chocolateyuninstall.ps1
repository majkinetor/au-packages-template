# Should not be necessary unless using an old version of Chocolatey
Uninstall-ChocolateyPackage `
  -PackageName $env:ChocolateyPackageName `
  -FileType 'exe' `
  -SilentArgs '/S' `
  -File "$env:ProgramFiles\Multipass\Uninstall.exe"

  Uninstall-BinFile -Name $env:ChocolateyPackageName -Path "$env:ProgramFiles\Multipass\bin\multipass.exe"