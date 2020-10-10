import-module au

$owner = "ahmetb"
$repo = "kubectx"
$releases = "https://github.com/$owner/$repo/releases"

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
  $regex   = "\/$owner\/$repo\/releases\/tag\/v\d{1,4}\.{0,1}\d{0,4}\.{0,1}\d{0,4}$"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $url = "https://github.com/$owner/$repo/releases/download/v$version/kubens_v$("$version")_windows_x86_64.zip"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor 64