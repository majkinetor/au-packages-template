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
	function getSourcemodLatestRelease {
		param($versionMajorMinor)
		$release = ((curl "https://sm.alliedmods.net/smdrop/$versionMajorMinor/").Links -match '-windows.zip').href | select -last 1
		$version = [version]($release -split '-')[1]
		$revision = ($release -split '-')[2] -replace '^git',''

		$build = ''

		if ($version.build) {
			$build = $version.build
		}

		@{
			URL32   = "https://sm.alliedmods.net/smdrop/$versionMajorMinor/$release"
			Version = ($version.major, $version.minor -join '.'), ($build, $revision -join '') -join '.'
		}
	}
	
	@{
		Streams = [ordered] @{
		    '1.9' = getSourcemodLatestRelease '1.9'
		    '1.8' = getSourcemodLatestRelease '1.8'
		}
	}
}

update
