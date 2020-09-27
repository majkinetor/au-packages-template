import-module au

$releases = "https://github.com/digitalcoyote/NuGetDefense/releases/"

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
			"(^.*--version\s)([0-9]{1,3}\.[0-9]{1,3}).*" = "`${1}$($Latest.Version)"
		}
	}
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '/digitalcoyote/NuGetDefense/releases/download/v[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}-*.*/NuGetDefense.Tool.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}-*.*.nupkg'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  Write-Output "$url"
  $version = $url -split '[\/,v]' | Select-Object -Skip 1 -Last 1
  return @{ Version = $version; URL64 = "https://www.github.com$url"}
}

Update-Package  -ChecksumFor none
