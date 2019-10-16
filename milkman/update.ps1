import-module au

$releases = "https://github.com/warmuuh/milkman/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/warmuuh\/milkman\/releases\/tag\/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $url = 'https://github.com/warmuuh/milkman/releases/download/' + $version + '/milkman-dist-win64-bin.zip'
  return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor 32