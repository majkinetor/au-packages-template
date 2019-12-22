import-module au

$releases = "https://github.com/CoatiSoftware/Sourcetrail/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url64Bit\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(ChecksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/CoatiSoftware\/Sourcetrail\/releases\/download\/\d{1,4}\.\d{1,4}\.\d{1,4}\/Sourcetrail_.*_Windows_64bit_Installer\.zip$'  
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1 -Skip 1
  Write-Host "Version: $version"
  $url = "https://github.com$url"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor 64