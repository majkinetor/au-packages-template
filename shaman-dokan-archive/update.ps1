import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum)'"
        }
    }
}

function global:au_GetLatest {
    $release = curl "https://api.github.com/repos/antiufo/Shaman.Dokan.Archive/releases/latest?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json
	
	@{
        URL32   = $release.assets.browser_download_url
        Version = $release.tag_name
    }
}

update
