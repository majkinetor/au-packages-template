import-module au

$releases = "https://github.com/instrumenta/kubeval/releases/"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/instrumenta\/kubeval\/releases\/tag\/\d{1,3}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $url = "https://github.com/instrumenta/kubeval/releases/download/$version/kubeval-windows-386.zip"
  $url64      = "https://github.com/instrumenta/kubeval/releases/download/$version/kubeval-windows-amd64.zip"
  return @{ Version = $version; URL32 = $url; URL64 = $url64; ChecksumType64 = 'sha512'; ChecksumType = 'sha512';}
}

Update-Package -ChecksumFor all