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

$version = '4.2.8.23479'

$packageArgs = @{
  packageName   = 'beyondcompare'
  fileType      = 'exe'
  url           = $url
  silentArgs = '/SP- /VERYSILENT /NORESTART'

  checksum      = ''
  checksumType  = 'sha256'
}

$checksumde = 'e1f8f150d57022da2dbb4024279bd6b731e516b4f5c2b7de5ddfab86fffce85d'
$checksumfr = '7b0eecffbf08dcb674027ad065000a142387881903339d2b40bb1b58b3eaf477'
$checksumjp = '022e9fc7a1e13ea3ab36061c30a6f227298f9578d70bfded6c4d930facef74cf'
$checksum = 'fad4d8b9d481d55ef3e71a58be7b2a40790565eebf732a089be7b3c786b0f6f5'

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
