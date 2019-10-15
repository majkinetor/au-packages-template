import-module au

$releases = "https://bonobogitserver.com/"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '.zip$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|.zip' | Select-Object -Last 1 -Skip 1 | % {$_` -Replace "_","."}
  $url = $releases + $url
  return @{ Version = $version; URL = $url }
}

Update-Package -ChecksumFor 32