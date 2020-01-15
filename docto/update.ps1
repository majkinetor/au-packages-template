import-module au

$releases = "https://github.com/tobya/DocTo/releases/"

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
  $regex   = '/tobya/DocTo/tree/v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}.*'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $ulrRegex   = "/tobya/DocTo/releases/download/[Vv]$version/docto.exe"
  $url = 'https://github.com' + ($download_page.links | Where-Object href -match $ulrRegex | Select-Object -First 1 -expand href)
  $versionParts = $version -split '\.'
  $version = $versionParts[0]
  $LastPeriod = $false
  for ($i = 1; $i -lt $versionParts.Count; $i++) {
    if($versionParts[$i] -match '^\d+$' -and !$LastPeriod){
      $version = $version + '.' + $versionParts[$i]
    }
    else {
      $LastPeriod = $true
      $version = $version + '-' + $versionParts[$i]
    }
  }
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32