import-module au

$releases = "https://github.com/mypaint/mypaint/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(Checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(ChecksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    ".\tools\VERIFICATION.txt"      = @{
      "(the release page for this version\s\().*?(\)\.)" = "`${1}$($Latest.VersionUrl)`$2"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing  
  $versionRegex = '\/mypaint\/mypaint\/releases\/tag\/v\d{1,3}\.\d{1,3}\.\d{1,3}.*'
  $regex64 = '.*mypaint-git-w64-\d{1,3}\.\d{1,3}\.\d{1,3}.*-installer\.exe'
  $versionurl = ($download_page.links | Where-Object href -match $versionRegex | Select-Object -First 1 -expand href)
  $version = $versionurl -split '\/|v' | Select-Object -Last 1
  $url64 = $download_page.links | Where-Object href -match $regex64 | Select-Object -First 1 -expand href
  
  while ($version.LastIndexOf(".") -gt $version.LastIndexOf("-") -and $version.LastIndexOf("-") -ne '-1') {
    $version = $version.remove($version.LastIndexOf("."), 1).insert($version.LastIndexOf("."), "-") 
  }
  foreach ($line in ((choco list mypaint --all) | Select-String -Pattern 'mypaint')) {
    if (($line -split ' ' | Select-Object -First 1 -Skip 1) -match $version) {
      $Script:OnChocolatey = $true
    }
  }

  $DownloadedFile = "$PSScriptRoot\tools\mypaint-git-w64-installer.exe"
  (New-Object System.Net.WebClient).DownloadFile($url64, $DownloadedFile)
  $CheckSum64 = (Get-FileHash -Path $DownloadedFile -Algorithm 'sha512').Hash
  Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mypaint/mypaint/master/Licenses.dep5' -OutFile 'tools\License.txt'

  return @{ Version = $version; ChecksumType64 = 'sha512'; Checksum64 = $CheckSum64; VersionUrl = $versionurl; }  
  
}
Update-Package -ChecksumFor none
