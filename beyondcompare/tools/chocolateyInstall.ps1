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

$version = '4.2.3.22587'

$packageArgs = @{
  packageName   = 'beyondcompare'
  fileType      = 'exe'
  url           = $url
  silentArgs = '/SP- /VERYSILENT /NORESTART'

  checksum      = ''
  checksumType  = 'sha256'
}

$checksumde = '7d46df8dca994c5988d38382ce9545ce6edcb041b4792eb9afa150081b6d1a8e'
$checksumfr = '972ab5ff8f5620d5baec1e6037431dbb7e5842cff041e36ac8801caab9f6aee3'
$checksumjp = 'a8d7dacbc1733f4950fc42e7d42e5a66e09b61f694070a0f787bea3280a2369a'
$checksum = 'f7e30fbeaaf6b763866065d7289563f14e98cc8df3e5c43dfd49c694c4e504fe'

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
