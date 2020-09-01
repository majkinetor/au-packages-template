import-module au

$releases = "https://github.com/Tichau/FileConverter/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url\s*=\s*)('.*')"            = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
      "(ChecksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $version = '1.0.2'
  $url = "https://downloads.getfiddler.com/win/Fiddler%20Everywhere%20$version.exe"
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512'; }
}

Update-Package -ChecksumFor all