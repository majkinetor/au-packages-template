import-module au
$releases = "https://github.com/gobuffalo/buffalo/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    "$($Latest.PackageName).nuspec" = @{
      "(\<releaseNotes\>\[Release Notes\]\().*?(\)\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
  }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = "\/gobuffalo\/buffalo\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}\/buffalo_\d{1,3}\.\d{1,3}\.\d{1,3}_windows_386.tar.gz$"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1 -Skip 1
  $version = $version -split 'v' | Select-Object -Last 1
  $url32 = "$releases/download/v$version/buffalo_$($version)_windows_386.tar.gz"  
  $url64 = "$releases/download/v$version/buffalo_$($version)_windows_amd64.tar.gz"
  $ReleaseNotesVersion = $version -replace '\.', ''
  $releaseNotes = "https://gobuffalo.io/en/docs/release-notes/buffalo/v$ReleaseNotesVersion/"
  return @{ Version = $version; URL = $url32; URL64 = $url64; ChecksumType32 = 'sha512'; ChecksumType64 = 'sha512'; ReleaseNotes = $releaseNotes;}
}

Update-Package -ChecksumFor all