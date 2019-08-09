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
    $release = curl -UseBasicParsing "https://api.github.com/repos/PKISharp/win-acme/releases/latest?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json
	
	@{
        URL32   = $release.assets.browser_download_url | ? {($_ -split '/')[-1] -match '^win-acme\.v[0-9.]+\.zip'}
        Version = $release.tag_name -replace '^v',''
    }
}

update
