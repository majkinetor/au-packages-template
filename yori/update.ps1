import-module au

$releases = "https://github.com/malxau/yori/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/malxau\/yori\/tree\/v\d{1,4}\.?\d{0,4}\.?\d{0,4}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $url = "http://malsmith.net/download?obj=yori/$version/win32/ysetup.exe"

  return @{ Version = $version; Url = $url; ChecksumType = 'sha512';}
}

Update-Package -ChecksumFor all