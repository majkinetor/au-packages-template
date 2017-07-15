$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName = 'PDFXchangeEditor' 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version    = $env:ChocolateyPackageVersion
$primaryDownloadUrl = "http://downloads.pdf-xchange.com/EditorV6.x86.msi"
$primaryDownloadUrl64 = "http://downloads.pdf-xchange.com/EditorV6.x64.msi"
$url        = "http://www.docu-track.co.uk/builds/$version/EditorV6.x86.msi"
$url64      = "http://www.docu-track.co.uk/builds/$version/EditorV6.x64.msi"
$checksum   = '6F4985A0602416D6B45DEB7AB0DE5A8909C5B4834E752F1B66F6EC2851B1563C'
$checksum64 = 'E45C9C68A3B9C9579C956DB0B46B6AFABA0C4C20768C2BF5F629416023A5FDD8'
$lastModified32 = New-Object -TypeName DateTimeOffset 2017, 6, 30, 0, 10, 27, 0 # Last modified time corresponding to this package version
$lastModified64 = New-Object -TypeName DateTimeOffset 2017, 6, 30, 0, 10, 2, 0 # Last modified time corresponding to this package version

# Tracker Software have fixed download URLs, but if the binary changes we can fall back to their alternate (but slower) download site
# so the package doesn't break.
function CheckDownload($url, $primaryDownloadUrl, [DateTimeOffset] $packageVersionLastModified)
{
    $headers = Get-WebHeaders -url $primaryDownloadUrl
    $lastModifiedHeader = $headers.'Last-Modified'

    $lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

    Write-Verbose "Package LastModified: $packageVersionLastModified"
    Write-Verbose "HTTP Last Modified  : $lastModified"

    if ($lastModified -ne $packageVersionLastModified) {
        Write-Warning "The download available at $primaryDownloadUrl has changed from what this package was expecting. Falling back to FTP for version-specific URL"
        $url
    } else {
        Write-Verbose "Primary URL matches package expectation"
        $primaryDownloadUrl
    }
}

$url = CheckDownload $url $primaryDownloadUrl $lastModified32
$url64 = CheckDownload $url64 $primaryDownloadUrl64 $lastModified64

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  silentArgs = '/quiet /norestart'
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PDF-XChange Editor'

  checksum = $checksum
  checksumType  = 'sha256' 
  checksum64 = $checksum64
  checksumType64= 'sha256' 
}

$arguments = @{}

$packageParameters = $env:chocolateyPackageParameters

if ($packageParameters) {
    $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
    $option_name = 'option'
    $value_name = 'value'

    if ($packageParameters -match $match_pattern ){
        $results = $packageParameters | Select-String $match_pattern -AllMatches
        $results.matches | ForEach-Object {
        $arguments.Add(
            $_.Groups[$option_name].Value.Trim(),
            $_.Groups[$value_name].Value.Trim())
    }
    }
    else
    {
        Throw "Package Parameters were found but were invalid (REGEX Failure)"
    }

    # http://help.tracker-software.com/EUM/default.aspx?pageid=PDFXEdit3:switches_for_msi_installers
    $customArguments = @{}

    if ($arguments.ContainsKey("NoDesktopShortcuts")) {
        Write-Host "You want NoDesktopShortcuts"
        $customArguments.Add("DESKTOP_SHORTCUTS", "0")
    }

    if ($arguments.ContainsKey("NoUpdater")) {
        Write-Host "You want NoUpdater"
        $customArguments.Add("NOUPDATER", "1")
    }

    if ($arguments.ContainsKey("NoViewInBrowsers")) {
        Write-Host "You want NoViewInBrowsers"
        $customArguments.Add("VIEW_IN_BROWSERS", "0")
    }

    if ($arguments.ContainsKey("NoSetAsDefault")) {
        Write-Host "You want NoSetAsDefault"
        $customArguments.Add("SET_AS_DEFAULT", "0")
    }

    if ($arguments.ContainsKey("NoProgramsMenuShortcuts")) {
        Write-Host "You want NoProgramsMenuShortcuts"
        $customArguments.Add("PROGRAMSMENU_SHORTCUTS", "0")
    }

} else {
    Write-Debug "No Package Parameters Passed in"
}

if ($customArguments.Count) { 
    $packageArgs.silentArgs += " " + (($customArguments.GetEnumerator() | ForEach-Object { "$($_.Name)=$($_.Value)" } ) -join " ")
}

Install-ChocolateyPackage @packageArgs
