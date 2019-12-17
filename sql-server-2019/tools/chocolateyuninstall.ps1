$ErrorActionPreference = 'Stop';

$setupARPPath = ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft SQL Server SQL2019').UninstallString).Replace("`"", "")

$setupPath = [IO.Path]::Combine([IO.Path]::GetDirectoryName([IO.Path]::GetDirectoryName($setupARPPath)), "setup.exe")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  file          = $setupPath
  silentArgs    = "/Q /ACTION=Uninstall /INSTANCENAME=MSSQLSERVER /FEATURES=SQLENGINE /SUPPRESSPRIVACYSTATEMENTNOTICE=True"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

Uninstall-ChocolateyPackage @packageArgs