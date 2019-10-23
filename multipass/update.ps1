import-module au

$releases = "https://github.com/CanonicalLtd/multipass/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    "$($Latest.PackageName).nuspec" = @{
      "(\<releaseNotes\>\[Release Notes\]\().*?(\)\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
  }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/CanonicalLtd\/multipass\/releases\/download\/v\d\.\d\.\d/multipass-\d\.\d\.\d\+win-win64\.exe$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|-|\+' | Select-Object -Last 1 -Skip 2
  $url = "https://github.com/CanonicalLtd/multipass/releases/download/v$version/multipass-$version+win-win64.exe"
  $releaseNotes = "https://github.com/CanonicalLtd/multipass/releases/tag/v$version"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512'; ReleaseNotes = $releaseNotes}
}

Update-Package -ChecksumFor 64