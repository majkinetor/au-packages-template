import-module au

$releases = "https://github.com/mypaint/mypaint/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/mypaint\/mypaint\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}.*\/mypaint-git-w64-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1 -Skip 1
  $url = "https://github.com$url"
  while($version.LastIndexOf(".") -gt $version.LastIndexOf("-") -and $version.LastIndexOf("-") -ne '-1'){
    $version = $version.remove($version.LastIndexOf("."),1).insert($version.LastIndexOf("."),"-") 
  }
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32