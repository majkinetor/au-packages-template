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
    $version = (curl https://api.github.com/repos/popcorn-official/popcorn-desktop/tags | ConvertFrom-Json).name
	
	if ($version -is [array]) {
		$version = $version[0]
	}
	
	@{
        URL32   = "https://get.popcorntime.sh/build/Popcorn-Time-$version-Setup.exe"
        Version = $version
    }
}

update
