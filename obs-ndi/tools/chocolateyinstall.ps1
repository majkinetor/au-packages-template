$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# First, install NDI Runtime
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'NDI 4 Runtime'
  fileType      = 'exe'
  silentArgs    = "/VERYSILENT /LOG /NORESTART /SUPPRESSMSGBOXES"

  validExitCodes= @(0)
  url           = "https://ndi.palakis.fr/runtime/ndi-runtime-4.5.1-Windows.exe"
  checksum      = 'AB9E6FE27ABD44874DA02E4E4A335883A2812A05F5AF63065E5DD53CAF7E4F64'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs

# Now install obs-ndi

# Find install location from registry, but fall back to ProgramFiles 
$installPath = "$ENV:ProgramFiles\obs-studio"
$key = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\OBS Studio' -ErrorAction SilentlyContinue)
if ($key) {
  $installPath = $key.'(default)'
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = "https://github.com/Palakis/obs-ndi/releases/download/4.9.0/obs-ndi-4.9.0-Windows.zip"
  checksum      = '531642B5A21A9774AC818C0913E9A8740CDA3993E25EB459DD3A3B5A81177A77'
  checksumType  = 'sha256'
  UnzipLocation = $installPath
  file          = "$toolsDir\obs-ndi.zip"
}

Install-ChocolateyZipPackage @packageArgs

Write-Warning "You must reboot your computer to make a new or updated NDI Runtime installation effective"
