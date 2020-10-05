import-module au
$releases = "https://github.com/Tarnadas/smmdb-client/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(CheckSum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(CheckSumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = "\/Tarnadas\/smmdb-client\/releases\/download\/\d{1,3}\.\d{1,3}\.\d{1,3}\/smmdb-client-windows.tar.gz$"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1 -Skip 1
  $url32 = "https://github.com$url"
  return @{ Version = $version; URL = $url32; ChecksumType32 = 'sha512'; ReleaseNotes = $releaseNotes;}
}

Update-Package -ChecksumFor all