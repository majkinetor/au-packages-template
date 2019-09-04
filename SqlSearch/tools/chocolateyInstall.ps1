$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum = 'AD91C5A582861006FA5AAE5B378E328C4A5A9125CB9B24C2AA4DA88A7ADC34CC'
$primaryDownloadUrl = 'https://download.red-gate.com/SQL_Search.exe'
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/SQLSearch/03Sep2019/SQLSearch.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2019, 9, 3, 12, 47, 27, 0 # Last modified time corresponding to this package version

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
  silentArgs    = "/IAgreeToTheEULA"
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
