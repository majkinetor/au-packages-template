import-module au

$releases = "https://github.com/NethermindEth/Nethermind/releases"

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
  $regex   = '\/NethermindEth\/nethermind\/releases\/download\/\d{1,3}\.\d{1,3}\.\d{1,3}.*\/nethermind-windows-amd64-\d{1,3}\.\d{1,3}\.\d{1,3}.*\.zip$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1 -Skip 1
  $url = "https://github.com$url"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor 64