import-module au

$releases = "https://github.com/030/n3dr/releases/"

function global:au_SearchReplace {
    @{
        "tools\VERIFICATION.txt" = @{
			"(?i)(\s+x32:).*" = "`${1} $($Latest.URL32)"
		}
	}
}

function global:au_BeforeUpdate() {
	Get-RemoteFiles -Purge -NoSuffix -FileNameBase "n3dr"
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '/030/n3dr/tree/[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}.*'
  $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  $url = "https://github.com/030/n3dr/releases/download/$version/n3dr-windows"
  return @{ Version = $version; URL32 = $url; ChecksumType32 = 'sha512'; FileType = 'exe';}
}

Update-Package  -ChecksumFor none -nocheckchocoversion
