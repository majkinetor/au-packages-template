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
	$baseURL = 'https://www.gnivc.ru'
	$filepath = (curl "$baseURL/software/fnspo/software_ul_fl/pdf417/").Links.href -match '\.rar$'
	$url = "$baseURL$filepath"
	([uri]$url).segments[-1] -match '_([0-9]+[0-9_]+[0-9]+)'

	@{
		URL32   = $url
		Version = $Matches[1] -replace '_','.'
	}
}

update
