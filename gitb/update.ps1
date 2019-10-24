import-module au

$releases = "https://github.com/vvatanabe/gitb/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
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
  $regex   = '\/vvatanabe\/gitb\/releases\/tag\/\d{1,3}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  Write-Host $url
  $version = $url -split '\/' | Select-Object -Last 1
  $url = "https://github.com/vvatanabe/gitb/releases/download/$version/gitb_$($version)_windows_386.zip"
  $url64 = "https://github.com/vvatanabe/gitb/releases/download/$version/gitb_$($version)_windows_amd64.zip"
  $releaseNotes = "https://github.com/vvatanabe/gitb/releases/tag/$version"
  return @{ Version = $version; URL32 = $url; ChecksumType32 = 'sha512'; URL64 = $url64; ChecksumType64 = 'sha512'; ReleaseNotes = $releaseNotes;}
}

Update-Package -ChecksumFor all