$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = "https://github.com/Fenrirthviti/obs-virtual-cam/releases/download/2.0.5/OBS-Virtualcam-2.0.5-Windows.zip"
$checksum = 'C33F1C884C33BEA15E9254A4CAB5F1B66403E2D2F2767562B8726E58B05D38FC'

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
Get-ChocolateyUnzip -FileFullPath $zipFile -Destination $toolsDir\OBS-VirtualCam

$obsInstall = [System.IO.Path]::Combine($env:ProgramFiles, "obs-studio")

# copy files and record destination file locations for uninstall
# avutil-56.dll and swscale-5.dll are already part of OBS Studio, so we don't replace those
Copy-Item -Recurse $toolsDir\OBS-VirtualCam\* -Exclude "avutil-56.dll", "swscale-5.dll" -Destination $obsInstall -Force -PassThru | 
  Where-Object { -not $_.PSIsContainer } | 
  Select-Object -ExpandProperty Fullname |
  Tee-Object -FilePath $toolsDir\files.txt |
  Write-Verbose

# Only copy these files if they don't exist at the destination
Get-ChildItem $toolsDir\OBS-VirtualCam\bin\32bit\ -Exclude obs* | 
  Where-Object { -not ( Test-Path ("$obsInstall\bin\32bit\$($_.Name)") ) } | 
  Copy-Item -Destination "$obsInstall\bin\32bit\" -PassThru | 
  Select-Object -ExpandProperty Fullname |
  Tee-Object -FilePath $toolsDir\files.txt -Append |
  Write-Verbose

Write-Verbose "Registering 32bit dll"
Start-ChocolateyProcessAsAdmin -Statements "/s `"$obsInstall\bin\32bit\obs-virtualsource.dll`"" -ExeToRun "c:\windows\system32\regsvr32.exe"

if (Get-OSArchitectureWidth -eq 64) {
  
  Write-Verbose "Registering 64bit dll"
  Start-ChocolateyProcessAsAdmin -Statements "/s `"$obsInstall\bin\64bit\obs-virtualsource.dll`"" -ExeToRun "c:\windows\system32\regsvr32.exe"
}
