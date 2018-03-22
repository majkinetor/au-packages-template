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
    $release = ((curl 'https://sm.alliedmods.net/smdrop/1.8/').Links -match '-windows.zip').href | select -last 1
	$major = ($release -split '-')[1]
	$minor = ($release -split '-')[2] -replace '^git',''
	
	@{
        URL32   = "https://sm.alliedmods.net/smdrop/1.8/$release"
        Version = "$major.$minor"
    }
}

update
