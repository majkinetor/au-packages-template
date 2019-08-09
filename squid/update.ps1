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
    $version = (curl -UseBasicParsing "https://api.github.com/repos/diladele/squid-windows/tags?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json).name[0] -replace '^1.',''
	
	@{
        URL32   = "http://packages.diladele.com/squid/$version/squid.msi"
        Version = $version
    }
}

update
