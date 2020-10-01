import-module au

$releases = "https://github.com/mypaint/mypaint/releases"
$Script:64Only = ''

function global:au_SearchReplace {
  if($64Only){
    @{
      ".\tools\chocolateyInstall.ps1" = @{
        "(Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        "(URL64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
        "(ChecksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      }}
  }else{
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
      "(URL\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
      "(ChecksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }}
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing  
  $versionRegex = '\/mypaint\/mypaint\/tree\/v\d{1,3}\.\d{1,3}\.\d{1,3}.*'
  $regex   = '.*mypaint-w32-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $regex64   = '.*mypaint-w64-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $versionurl = ($download_page.links | Where-Object href -match $versionRegex | Select-Object -First 1 -expand href)
  $version =  $versionurl -split '\/|v' | Select-Object -Last 1
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $url = "https://github.com/$url"
  $url64     = $download_page.links | Where-Object href -match $regex64 | Select-Object -First 1 -expand href
  $url64 = "https://github.com/$url64"
  
  while($version.LastIndexOf(".") -gt $version.LastIndexOf("-") -and $version.LastIndexOf("-") -ne '-1'){
    $version = $version.remove($version.LastIndexOf("."),1).insert($version.LastIndexOf("."),"-") 
  }
  # $DownloadedFile = "$PSScriptRoot\tools\mypaint-git-w64-$version-installer.exe"
  # Write-Host "PSSCRIPTROOT: $PSScriptRoot"

  # Write-Host "DownloadedFile = $DownloadedFile"
  # (New-Object System.Net.WebClient).DownloadFile($url64, $DownloadedFile)
  # $CheckSum64 = (Get-FileHash -Path $DownloadedFile -Algorithm 'sha512').Hash
  Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mypaint/mypaint/master/Licenses.dep5' -OutFile 'tools\License.txt'

  if($null -ne $url){
    # $DownloadedFile = "$PSScriptRoot\tools\mypaint-git-w32-$version-installer.exe"
    # Write-Host "DownloadedFile = $DownloadedFile"

    # (New-Object System.Net.WebClient).DownloadFile($url, $DownloadedFile)
    # $CheckSum32 = (Get-FileHash -Path $DownloadedFile -Algorithm 'sha512').Hash
    Copy-Item -Path 'chocolateyinstall32and64.ps1' -Destination 'tools\chocolateyinstall.ps1'
    return @{ Version = $version; Checksum32 = $CheckSum32; ChecksumType32 = 'sha512'; Checksum64 = $CheckSum64; ChecksumType64 = 'sha512'; URL = $url; URL64 = $url64}

  }
  else{
    Write-Host "No  32-bit Installer Available"
    $Script:64Only = 'true'
    Copy-Item -Path 'chocolateyinstall64only.ps1' -Destination 'tools\chocolateyinstall.ps1'
    return @{ Version = $version; URL64 = $url64; ChecksumType64 = 'sha512'; Checksum64 = $CheckSum64;}  

  }
  
}

Update-Package -ChecksumFor all
