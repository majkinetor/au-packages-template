import-module au
$releases = "https://github.com/jenkins-zh/jenkins-cli/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      # "(Url\s*=\s*)('.*')"            = "`$1'$($Latest.URL)'"
      "(Url\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
      # "(CheckSum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"     
      "(CheckSum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      # "(CheckSumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
      "(CheckSumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = "\/jenkins-zh\/jenkins-cli\/tree\/v\d{1,3}\.\d{1,3}\.\d{1,3}"
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $version = $version -split 'v' | Select-Object -Last 1
  # $url32 = "https://github.com/jenkins-zh/jenkins-cli/releases/download/v$version/jcli-windows-386.zip"
  $url64 = "https://github.com/jenkins-zh/jenkins-cli/releases/download/v$version/jcli-windows-amd64.zip"

  return @{ Version = $version; URL64 = $url64; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor all