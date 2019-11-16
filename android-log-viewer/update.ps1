import-module au

$releases = "https://github.com/MarkusPalcer/AndroidLogViewer/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = "\/MarkusPalcer\/AndroidLogViewer\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}\/Android.Log.Viewer.msi$"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1 -Skip 1
  $version = $version -split 'v' | Select-Object -Last 1
  $url = "https://github.com/MarkusPalcer/AndroidLogViewer/releases/download/v$version/Android.Log.Viewer.msi"
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32