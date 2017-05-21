$ErrorActionPreference = 'Stop';

$packageName  = 'ozcode-vs2017'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileName     = "OzCode_3.0.0.3597_FOR_VS2017.vsix"
$fileFullPath = "$toolsDir\$fileName"

# Find latest VS 2017 instance
# We can't use Install-ChocolateyVsixPackage for 2017 yet.
$xml = [xml] (vswhere -version "[15.0,16.0)" -latest -requires Microsoft.Net.ComponentGroup.DevelopmentPrerequisites -format xml)

if (-not $xml.instances.HasChildNodes) {
    Write-Error "No suitable instances of Visual Studio 2017 were found to install OzCode"
}

$vsixInstaller = (Join-Path $xml.instances.instance.installationPath "Common7\IDE\VSIXInstaller.exe")

if (-not (Test-Path $vsixInstaller)) {
    Write-Error "Could not find VSIXInstaller.exe"
}

$packageArgs = @{
  packageName   = $packageName
  fileFullPath = $fileFullPath
  url           = "http://downloads.oz-code.com/files/$fileName"  #download URL, HTTPS preferrred
  checksum      = '3A493231FA4040AD90F5384AD8F86AF19A39F5F8B4DDBFB2332A970CD97669FF'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

& $vsixInstaller $fileFullPath /logfile:`"$env:TEMP\$($packageName)\$($packageName).VsixInstall.log`"