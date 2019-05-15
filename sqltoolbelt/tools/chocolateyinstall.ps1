$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$primaryDownloadUrl = "https://download.red-gate.com/SQLToolbelt.exe"
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/SQLToolbelt/14May2019/SQLToolbelt.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2019, 5, 14, 13, 54, 32, 0 # Last modified time corresponding to this package version
$checksum = 'F41AC50C94A91532BA4254B075B428F9D1C5DAC8BC689AB9A04F96AC69C3AAF1'

$validProductPackageNames = @(
  "SQL Compare",
  "SQL Data Compare",
  "SQL Source Control",
  "SQL Prompt",
  "SQL Search",
  "SQL Data Generator",
  "SQL Doc",
  "SQL Test",
  "DLM Dashboard",
  "SQL Multi Script",
  "SQL Dependency Tracker",
  "SQL Monitor Installer",
  "SQL Backup",
  "SSMS Integration Pack",
  "SQL Change Automation Powershell",
  "SQL Change Automation" )

$pp = Get-PackageParameters

$commandArgs = ""
if ($pp["products"] -ne $null -and $pp["products"] -ne ''){

  $products = $pp["products"].Split(",")
  foreach($product in $products){
    if(!$validProductPackageNames.Contains($product.Trim())){
      throw "Invalid product package name '$product', exiting installer."
    }
  }

  $productCommand = "products ""$($pp["products"])"""
  $commandArgs += "$productCommand "
} else {

  $productCommand = "all products"
}

$commandArgs += "/IAgreeToTheEula"

$url = $primaryDownloadUrl

if ($pp["FTP"] -ne $null -and $pp["FTP"] -ne '') { 

  # FTP forced
  Write-Verbose "Using $secondaryDownloadUrl because /FTP was specified"
  $url = $secondaryDownloadUrl
} else {

  # Red Gate has a fixed download URL, but if the binary changes we can fall back to their FTP site
  # so the package doesn't break
  $headers = Get-WebHeaders -url $primaryDownloadUrl
  $lastModifiedHeader = $headers.'Last-Modified'

  $lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

  Write-Verbose "Package LastModified: $packageVersionLastModified"
  Write-Verbose "HTTP Last Modified  : $lastModified"

  if ($lastModified -ne $packageVersionLastModified) {
    if ($pp["NoFTP"]) {
      Write-Warning "The download available at $primaryDownloadUrl has changed from what this package was expecting, but /NoFTP package parameter was supplied. Expect checksums to fail if the download is actually a newer version."
    } else {
      Write-Warning "The download available at $primaryDownloadUrl has changed from what this package was expecting. Falling back to FTP for version-specific URL"
      $url = $secondaryDownloadUrl
    }
  } else {
    Write-Verbose "Primary URL matches package expectation"
  }
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = $commandArgs

  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
