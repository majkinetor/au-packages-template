$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum = '7E58BD20EF7DB457EB27BEBA952464B4188100AE72E833E7167700462CC0C71E'
$primaryDownloadUrl = 'https://download.red-gate.com/DotNETDeveloperBundle.exe'
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/DotNETDeveloperBundle/04Oct2018/DotNETDeveloperBundle.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2018, 10, 4, 15, 6, 55, 0 # Last modified time corresponding to this package version

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
