import-module au

$releases = "https://github.com/biome-sh/biome/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(CheckSum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(CheckSumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/biome-sh\/biome\/tree\/bio-\d{1,3}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|bio-' | Select-Object -Last 1
  $url = "https://github.com/biome-sh/biome/releases/download/bio-$version/bio-$version-x86_64-windows.zip"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor 64