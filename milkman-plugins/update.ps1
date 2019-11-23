import-module au

$releases = "https://github.com/warmuuh/milkman/releases"
$PackageName = "milkman-note"
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    "$PackageName.nuspec" = @{
      "(\<dependency id=""milkman"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-explore"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-graphql"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-jdbc"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-privatebin"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-scripting"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-note"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-sync-git"" version=""\[).*(\]"" />)" = "`${1}$($Latest.Version)`$2"
    }
  }
}

function script:au_BeforeUpdate() {
  $Latest.Checksum64 = (Get-FileHash -Path "tools\$PackageName.jar" -Algorithm SHA512).Hash
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