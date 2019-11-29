import-module au

$releases = "https://github.com/warmuuh/milkman/releases"
$PackageName = "milkman-jdbc"
function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
      "(^[$]checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
    "$PackageName.nuspec" = @{
      "(\<dependency id=""milkman"" version=""\[).*(\]""\s*/>)" = "`${1}$($Latest.Version)`$2"
    }
  }
}

function global:au_BeforeUpdate() {
  $Latest.Checksum64 = (Get-FileHash -Path "tools\$PackageName.jar" -Algorithm SHA512).Hash
  $Latest.ChecksumType64 = 'sha512'
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/warmuuh\/milkman\/releases\/tag\/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $url = 'https://github.com/warmuuh/milkman/releases/download/' + $version + '/milkman-dist-plugins-bin.zip'
  $DownloadedFile = "$PSScriptRoot\milkman-dist-plugins-bin.zip"
  (New-Object System.Net.WebClient).DownloadFile($url, $DownloadedFile)
  Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/warmuuh/milkman/master/LICENSE' -OutFile 'tools\License.txt'
  $UnzipDirectory = "$PSScriptRoot\milkman-dist-plugins-bin\"
  Expand-Archive -Path $DownloadedFile -DestinationPath $UnzipDirectory -Force
  Get-ChildItem -Path $UnzipDirectory  -Filter "$PackageName.jar" -Recurse | Select-Object -first 1 | Copy-Item -Destination "tools\$PackageName.jar"
  Remove-Item -Path "milkman-dist-plugins-bin.zip"
  Remove-Item -Path "milkman-dist-plugins-bin" -Recurse
  return @{ Version = $version;}
}

Update-Package -ChecksumFor none