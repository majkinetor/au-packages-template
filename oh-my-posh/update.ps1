import-module au

$releases = "https://github.com/kubernetes-sigs/kind/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]version\s*=\s*)('.*')"  = "`$1'$($Latest.Version)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/kubernetes-sigs\/kind\/releases\/tag\/\d{1,3}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  return @{ Version = $version; }
}

Update-Package -ChecksumFor none