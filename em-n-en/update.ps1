import-module au

$releases = "https://github.com/CemraJC/em-n-en/releases/"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/CemraJC\/em-n-en\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}\/Em-n-en.exe$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1 -Skip 1
  $url = "https://github.com/CemraJC/em-n-en/releases/download/v$version/Em-n-en.exe"
  return @{ Version = $version; URL = $url; ChecksumType = 'sha512';}
}

Update-Package -ChecksumFor 32