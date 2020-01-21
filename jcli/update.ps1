import-module au
$releases = "https://github.com/jenkins-zh/jenkins-cli/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(CheckSum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(CheckSumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = "\/jenkins-zh\/jenkins-cli\/tree\/v\d{1,3}\.\d{1,3}\.\d{1,3}"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $version = $version -split 'v' | Select-Object -Last 1
  $regex = "\/jenkins-zh\/jenkins-cli\/releases\/download\/v$version\/.*windows.*\.tar\.gz"
  $url32 = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  return @{ Version = $version; URL = "https://github.com/$url32"; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32