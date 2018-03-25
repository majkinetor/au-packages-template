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
    $release = curl "https://api.github.com/repos/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/latest?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json
	
	@{
		URL32   = ($release.assets -match 'i686-w64-mingw32.zip').browser_download_url
        URL64   = ($release.assets -match 'x86_64-w64-mingw32.zip').browser_download_url
        Version = ((($release.tag_name -split '_')[0] -split '=')[1] -split '-')[1]
    }
}

update
