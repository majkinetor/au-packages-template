import-module au

$releases = "https://github.com/warmuuh/milkman/releases"
$PackageName = "milkman-plugins"
function global:au_SearchReplace {
  @{

    "$PackageName.nuspec" = @{
      "(\<dependency id=""milkman"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-explore"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-graphql"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-jdbc"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-privatebin"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-scripting"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-note"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
      "(\<dependency id=""milkman-sync-git"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/warmuuh\/milkman\/releases\/tag\/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  return @{ Version = $version;}
}

Update-Package -ChecksumFor none