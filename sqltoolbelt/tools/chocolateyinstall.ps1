$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$primaryDownloadUrl = "https://download.red-gate.com/SQLToolbelt.exe"
$secondaryDownloadUrl = 'ftp://support.red-gate.com/patches/SQLToolbelt/10Aug2018/SQLToolbelt.exe'
$packageVersionLastModified = New-Object -TypeName DateTimeOffset 2018, 8, 10, 10, 15, 7, 0 # Last modified time corresponding to this package version
$checksum = 'E5DEA9514A5FF57F790369D288D0CB5C7E035D6D99ED1A93F8F131BF6153316C'

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
  "SQL Monitor",
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

if ($pp["FTP"] -ne $null -and $pp["FTP"] -ne '') { 

  # FTP forced  
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
  silentArgs    = $commandArgs

  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
