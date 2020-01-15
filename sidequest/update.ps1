import-module au

$releases = "https://github.com/the-expanse/SideQuest/releases"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(URL64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
      "(Checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(ChecksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '/the-expanse/SideQuest/releases/download/v[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/SideQuest-Setup-[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}-x64-win\.exe$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/|-' | Select-Object -Last 1 -Skip 2
  $url = "https://github.com/the-expanse/SideQuest/releases/download/v$version/SideQuest-Setup-$version-x64-win.exe"
  return @{ Version = $version; URL64 = $url; ChecksumType64 = 'sha512';}
}

Update-Package -ChecksumFor 64