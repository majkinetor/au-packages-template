$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://github.com/CatxFish/obs-virtual-cam/releases/download/2.0.4/OBS-VirtualCam2.0.4.zip"
$checksum = '6A248C73499E911AE1DA0224FF2D21A07E2E1EC4416987C2D5F34718D9B3D730'

$zipFile = [System.IO.Path]::Combine($toolsDir, [System.IO.Path]::GetFileName($url))

# We don't use the installer as you can't suppress the message box prompts from the regsvr registration

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  fileFullPath   = $zipFile
}

Get-ChocolateyWebFile @packageArgs
Get-ChocolateyUnzip -FileFullPath $zipFile -Destination $toolsDir

$obsInstall = [System.IO.Path]::Combine($env:ProgramFiles, "obs-studio")

# copy files and record destination file locations for uninstall
# avutil-56.dll and swscale-5.dll are already part of OBS Studio, so we don't replace those
Copy-Item -Recurse $toolsDir\OBS-VirtualCam\* -Exclude "avutil-56.dll", "swscale-5.dll" -Destination $obsInstall -Force -PassThru | Where-Object { -not $_.PSIsContainer } | Set-Content -path $toolsDir\files.txt


if (Get-OSArchitectureWidth -eq 64) {
  Write-Verbose "Registering 32bit dll"
  Start-ChocolateyProcessAsAdmin -Statements "c:\windows\SysWoW64\regsvr32.exe /s `"$obsInstall\bin\32bit\obs-virtualsource.dll`""
  
  Write-Verbose "Registering 64bit dll"
  Start-ChocolateyProcessAsAdmin -Statements "/s `"$obsInstall\bin\64bit\obs-virtualsource.dll`"" -ExeToRun "C:\Windows\System32\regsvr32.exe"
} else {
  Write-Verbose "Registering 32bit dll"
  Start-ChocolateyProcessAsAdmin -Statements "c:\windows\System32\regsvr32.exe /s `"$obsInstall\bin\32bit\obs-virtualsource.dll`""
}

Write-Warning "The previous calls to Start-ChocolateyProcessAsAdmin may generate red text, but it isn't an error"
