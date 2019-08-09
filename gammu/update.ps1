import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $version = ((curl -UseBasicParsing "https://api.github.com/repos/gammu/gammu/tags?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json) | where {$_.name -match '^[0-9.]+$'}).name[0]
	
	@{
        URL32   = "https://dl.cihar.com/gammu/releases/windows/Gammu-$version-Windows.exe"
		URL64   = "https://dl.cihar.com/gammu/releases/windows/Gammu-$version-Windows-64bit.exe"
        Version = $version
    }
}

update
