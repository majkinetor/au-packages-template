import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
	$versions = [ordered]@{}

	(curl "https://api.github.com/repos/DavidMoore/ipfilter/releases?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json) | % {
		$version = $_.tag_name

		$url = ($_.assets | where {$_.name -match '\.msi$'}).browser_download_url

		if ($url) { $versions[$version] = @{
			URL32   = $url
			Version = $_.tag_name
		} }
	}

	@{Streams = $versions}
}

update
