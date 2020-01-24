import-module au

$releases = "https://github.com/sqshq/sampler/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64)'"
      "(CheckSum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(CheckSumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex = '\/sqshq\/sampler\/tree\/v\d{1,3}\.\d{1,3}\.\d{1,3}'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $url = "https://github.com/sqshq/sampler/releases/download/v$version/sampler-$version-windows-amd64.exe"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512'; }
}

Update-Package -ChecksumFor 64