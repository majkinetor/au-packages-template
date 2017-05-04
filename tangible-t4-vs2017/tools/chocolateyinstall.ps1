$ErrorActionPreference = 'Stop';

$packageName  = 'tangible-t4-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Import private function from chocolatey-visualstudio.extension
Import-Module $Env:ChocolateyInstall\extensions\chocolatey-visualstudio\*.psm1

$cmd = Get-Command -Name "Install-VisualStudio"
$extensionPath = $cmd.Module.ModuleBase

. ("$extensionPath\Get-WillowInstalledProducts.ps1")

if (-not (Get-WillowInstalledProducts -VisualStudioYear 2017)) {
    Write-Error "Visual Studio 2017 installations not found on this computer"
}

#Based on MSI
$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'tangible T4 editor plus modeling tools V2 (VS2017)'
  fileType      = 'msi'
  # Note. the MSI is calling the CheckVSInstalledAction custom action during the InstallUISequence, so we can't use /qn
  # /qr shows a 'reduced' UI which is enough to allow the custom action to run, but doesn't require any user input
  # Reported via http://t4-editor.tangible-engineering.com/forum/forum.aspx?g=posts&t=1524
  silentArgs    = "/qr /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
  url           = "https://visualstudiogallery.msdn.microsoft.com/6a6911d2-7ddb-48dc-9c85-22993c1893f4/file/259042/1/tangibleT4EditorPlusModellingToolsVS2017.msi"
  checksum      = '2D1C0B3FA7C35AC99A76B72585450D604C8A774CC53FB4EEF77B34373EEF4E1B'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs