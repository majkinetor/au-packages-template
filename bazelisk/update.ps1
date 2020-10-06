import-module au

$releases = "https://github.com/bazelbuild/bazelisk/releases/"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
      "(ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '/bazelbuild/bazelisk/releases/tag/v[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}.*'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|v' | Select-Object -Last 1
  $url = "https://github.com/bazelbuild/bazelisk/releases/download/v$version/bazelisk-windows-amd64.exe"
  return @{ Version = $version; URL = $url; ChecksumType = 'sha512';}
}

Update-Package -ChecksumFor 32