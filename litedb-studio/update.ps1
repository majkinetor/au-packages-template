import-module au

$releases = "https://github.com/mbdavid/LiteDB.Studio/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '/mbdavid/LiteDB.Studio/tree/v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}.*'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $url = "https://github.com/mbdavid/LiteDB.Studio/releases/download/v$version/LiteDB.Studio.exe"
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32