import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
	$baseURL = 'https://r1ch.net'
	$filepath = (curl -UseBasicParsing "$baseURL/projects/twitchtest").Links.href -match '\.zip'
	"$filepath" -match '[0-9]+[0-9.]+[0-9]+' > $null
	$version = $Matches[0] -split '\.'
	$version[1] = [int]$version[1] * 10
		
	@{
		URL32   = "$baseURL$filepath"
		Version = $version -join '.'
	}
}

update
