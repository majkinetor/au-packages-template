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
	$filepath = (curl "$baseURL/software/fnspo/software_ul_fl/registration/").Links.href -match '\.exe$'
	$url = "$baseURL$filepath"
	([uri]$url).segments[-2] -match '[0-9]+[0-9.]+[0-9]+'
	
	@{
        URL32   = $url
        Version = $Matches[0]
    }
}

update
