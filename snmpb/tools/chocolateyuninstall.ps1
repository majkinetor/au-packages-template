$installDir = "$((${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0])\SnmpB"

Start-ChocolateyProcessAsAdmin -Statements "/S" -ExeToRun "$installDir\Uninstall.exe" -ValidExitCodes @(0)

Uninstall-BinFile -Name snmpb