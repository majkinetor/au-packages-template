$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# unregister
$obsInstall = [System.IO.Path]::Combine($env:ProgramFiles, "obs-studio")

Write-Verbose "Unregistering 32bit dll"
Start-ChocolateyProcessAsAdmin -Statements "/s /u `"$obsInstall\bin\32bit\obs-virtualsource.dll`"" -ExeToRun "c:\windows\system32\regsvr32.exe"

if (Get-OSArchitectureWidth -eq 64) {

    Write-Verbose "Unregistering 64bit dll"
    Start-ChocolateyProcessAsAdmin -Statements "/s /u `"$obsInstall\bin\64bit\obs-virtualsource.dll`"" -ExeToRun "c:\windows\system32\regsvr32.exe"
}

# remove files
Write-Warning "If any running application has been using the virtual camera, these files may be locked for deletion"
(Get-Content $toolsDir\files.txt) | Where-Object { Test-Path $_ } | Remove-Item -Verbose -Force

Remove-Item "$obsInstall\data\obs-plugins\obs-virtualoutput" -Recurse -Force