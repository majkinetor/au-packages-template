import-module au

$releases = "https://github.com/CoatiSoftware/Sourcetrail/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Url64Bit\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(Url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(CheckSum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(CheckSumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      "(CheckSumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/CoatiSoftware\/Sourcetrail\/releases\/tag\/\d{1,4}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $installversion = $version -replace '\.', '_'
  $url32 = "https://github.com/CoatiSoftware/Sourcetrail/releases/download/$version/Sourcetrail_$($installversion)_Windows_32bit_Installer.zip"
  $url64 = "https://github.com/CoatiSoftware/Sourcetrail/releases/download/$version/Sourcetrail_$($installversion)_Windows_64bit_Installer.zip"
  return @{ Version = $version; URL = $url32; URL64 = $url64; ChecksumType64 = 'sha512'; ChecksumType32 = 'sha512';}
}

Update-Package -ChecksumFor all