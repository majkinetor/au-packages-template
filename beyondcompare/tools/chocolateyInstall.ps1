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

$version = '4.2.0.22302'

$packageArgs = @{
  packageName   = 'beyondcompare'
  fileType      = 'exe'
  url           = $url
  silentArgs = '/SP- /VERYSILENT /NORESTART'

  checksum      = ''
  checksumType  = 'sha256'
}

$checksumde = '96ABEF13A497C977724352FA9E5F74701D607E21925193692E989552C7D61BFA'
$checksumfr = 'E55B0BCC79636CC40B4079A59E993445635CAB2E702E4E859116FD8FE5F402DD'
$checksumjp = 'ED358950A0DB8E7698F25DADA98AA9537CBC37B01620596409BE0F4A1D707A40'
$checksum = '57B89DD46C912E17DBD3680672135629301E004B124CD08A1AE694EBB3948B7D'

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