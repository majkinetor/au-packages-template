import-module au

$releases = "https://github.com/mypaint/mypaint/releases"
$Script:64Only = ''

function global:au_SearchReplace {
  if($64Only){
    @{
      ".\tools\chocolateyInstall.ps1" = @{
        "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
        "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      }}
  }else{
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType32\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }}
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/mypaint\/mypaint\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}.*\/mypaint-git-w32-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $regex64   = '\/mypaint\/mypaint\/releases\/download\/v\d{1,3}\.\d{1,3}\.\d{1,3}.*\/mypaint-git-w64-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $url64     = $download_page.links | Where-Object href -match $regex64 | Select-Object -First 1 -expand href
  $version = $url64 -split '\/|v' | Select-Object -Last 1 -Skip 1
  $url = "https://github.com$url"
  $url64 = "https://github.com$url64"
  while($version.LastIndexOf(".") -gt $version.LastIndexOf("-") -and $version.LastIndexOf("-") -ne '-1'){
    $version = $version.remove($version.LastIndexOf("."),1).insert($version.LastIndexOf("."),"-") 
  }
  if($null -ne $url){
    Copy-Item -Path 'chocolateyinstall32and64.ps1' -Destination 'tools\chocolateyinstall.ps1'
    $Script:64Only = 'true'
    Write-Host "No  32-bit Installer Available"
    return @{ Version = $version; URL = $url64; ChecksumType64 = 'sha512';}  
  }
  else{
    Copy-Item -Path 'chocolateyinstall64only.ps1' -Destination 'tools\chocolateyinstall.ps1'
    return @{ Version = $version; URL = $url; ChecksumType32 = 'sha512';ChecksumType64 = 'sha512'; URL64 = $url64;}
  }
  
}

if($64Only){
Update-Package -ChecksumFor all
}
else {
  Update-Package -Checksum 64
}