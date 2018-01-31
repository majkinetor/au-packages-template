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

$version = '4.2.4.22795'

$packageArgs = @{
  packageName   = 'beyondcompare'
  fileType      = 'exe'
  url           = $url
  silentArgs = '/SP- /VERYSILENT /NORESTART'

  checksum      = ''
  checksumType  = 'sha256'
}

$checksumde = '7fa7f900008e609d291f7dc5063c28a348cf94eac2b8b5c3b85df2f282734bfb'
$checksumfr = 'd56cd81ea7a09d4a81b7909ec0f376233c78117cc61b16ded8dd83da5a61fd7f'
$checksumjp = '67d6f947dadf0f3fb19e9129fb6a144cb6bf7e232e2ee75dc680e7ebcf22726e'
$checksum = 'b4b2bed8e5fe16a8680ffb4f3827a892cbfecc58803cc59c70bc66e60a92e291'

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
