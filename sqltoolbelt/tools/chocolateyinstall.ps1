$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$primaryDownloadUrl = "https://download.red-gate.com/SQLToolbelt.exe"
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/SQLToolbelt/06Sep2017/SQLToolbelt.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2017, 9, 6, 14, 46, 40, 0 # Last modified time corresponding to this package version
$checksum = 'B65DA5D3A8B4241B3AB199E1CFBA7A7056DE246A0521F9A69E41BA1DE74F38E2'

$pp = Get-PackageParameters

if ($pp["FTP"] -ne $null -and $pp["FTP"] -ne '') { 

  # FTP forced  
    $url = $secondaryDownloadUrl
} else {

  # Red Gate have a fixed download URL, but if the binary changes we can fall back to their FTP site
  # so the package doesn't break
  $headers = Get-WebHeaders -url $primaryDownloadUrl
  $lastModifiedHeader = $headers.'Last-Modified'

  $lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

  Write-Verbose "Package LastModified: $packageVersionLastModified"
  Write-Verbose "HTTP Last Modified  : $lastModified"

  if ($lastModified -ne $packageVersionLastModified) {
    Write-Warning "The download available at $primaryDownloadUrl has changed from what this package was expecting. Falling back to FTP for version-specific URL"
    $url = $secondaryDownloadUrl
  } else {
    Write-Verbose "Primary URL matches package expectation"
    $url = $primaryDownloadUrl
  }
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/IAgreeToTheEula"
  
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
