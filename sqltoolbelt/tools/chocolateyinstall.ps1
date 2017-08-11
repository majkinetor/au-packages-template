$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$primaryDownloadUrl = "https://download.red-gate.com/SQLToolbelt.exe"
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/SQLToolbelt/10Aug2017/SQLToolbelt.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2017, 8, 10, 17, 26, 25, 0 # Last modified time corresponding to this package version
$checksum = '39E0E99AE9BB67E6C0F8EFC3AE0A16CB5A019DBCA2B4D5D716BB654AA5105AC2'

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
