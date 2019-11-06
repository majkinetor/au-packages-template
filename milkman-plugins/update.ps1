import-module au

$releases = "https://github.com/warmuuh/milkman/releases"
$PackageName = "milkman-note"
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    "milkman-plugins.nuspec" = @{
      "(<version>)(.*)(</version>)" = "`$1'$($Latest.Version)'"
    }
  }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum64 = Get-FileHash -Path "tools\$PackageName.jar" -Algorithm SHA512
  $Latest.ChecksumType64 = 'sha512'
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/warmuuh\/milkman\/releases\/tag\/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  return @{ Version = $version;}
}

Update-Package -ChecksumFor none