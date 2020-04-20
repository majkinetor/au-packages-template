$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# unregister
$obsInstall = [System.IO.Path]::Combine($env:ProgramFiles, "obs-studio")

if (Get-OSArchitectureWidth -eq 64) {
    Write-Verbose "Unregistering 32bit dll"
    Start-ChocolateyProcessAsAdmin -Statements "c:\windows\SysWoW64\regsvr32.exe /s /u `"$obsInstall\bin\32bit\obs-virtualsource.dll`""

    Write-Verbose "Unregistering 64bit dll"
    Start-ChocolateyProcessAsAdmin -Statements "/s `"$obsInstall\bin\64bit\obs-virtualsource.dll`"" -ExeToRun "C:\Windows\System32\regsvr32.exe"
} else {
    Write-Verbose "Unregistering 32bit dll"
    Start-ChocolateyProcessAsAdmin -Statements "c:\windows\System32\regsvr32.exe /s /u `"$obsInstall\bin\32bit\obs-virtualsource.dll`""
}

Write-Warning "The previous calls to Start-ChocolateyProcessAsAdmin may generate red text, but it isn't an error"
# remove files

(Get-Content $toolsDir\files.txt) | Remove-Item

Remove-Item "$obsInstall\data\obs-plugins\obs-virtualoutput" -Recurse -Force