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
    $release = curl "https://api.github.com/repos/nsqio/nsq/releases/latest?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json
	$version = $release.tag_name -replace '^v',''
	
	@{
        URL32   = "https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-$version.windows-x64.zip"
        Version = $version
    }
}

update
