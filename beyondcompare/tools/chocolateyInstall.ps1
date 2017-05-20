$ErrorActionPreference = 'Stop'

$urlBase = "https://www.scootersoftware.com"

$pp = Get-PackageParameters

if ($pp["UICulture"] -ne $null) {
    $LCID = (Get-UICulture).LCID
    Write-Debug "Calling Get-UICulture (instead of Get-Culture)"
} else {
    $LCID = (Get-Culture).LCID
}

$german = @(3079,1031,5127,4103,2055)
$french = @(2060,11276,3084,9228,12300,1036,5132,13324,6156,14348,10252,4108,7180)
$japanese = @(17, 1041)

$version = '4.2.2.22384'

$packageArgs = @{
  packageName   = 'beyondcompare'
  fileType      = 'exe'
  url           = $url
  silentArgs = '/SP- /VERYSILENT /NORESTART'

  checksum      = ''
  checksumType  = 'sha256'
}

$checksumde = '285e0fbadc283f949e2e699441e41f6c18606fba58eba40b0cc08ea92904fab4'
$checksumfr = '402236ce4fdfb544fe4514459a9e4fdc5a8af35a6829c6d88629afb5dbf059b0'
$checksumjp = 'de8e1b72f2bf18168b45447f2b495f66d78afb0577c4ae9d26a86865f9bd996d'
$checksum = '803536b797c0edfdc99ce82cd7ca2328648f5ea79a6f2f65618a5ad79c14cda8'

if ($german -contains $LCID)
{
    $packageArgs.url = "$urlBase/BCompare-de-$version.exe"
    $packageArgs.checksum = $checksumde
}
elseif ($french -contains $LCID)
{
    $packageArgs.url = "$urlBase/BCompare-fr-$version.exe"
    $packageArgs.checksum = $checksumfr
}
elseif ($japanese -contains $LCID)
{
    $packageArgs.url = "$urlBase/BCompare-jp-$version.exe"
    $packageArgs.checksum = $checksumjp
}
else
{
    $packageArgs.url = "$urlBase/BCompare-$version.exe"
    $packageArgs.checksum = $checksum
}

Install-ChocolateyPackage @packageArgs
