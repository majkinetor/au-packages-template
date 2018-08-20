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
	$hostname = 'https://teleofis.ru'

	$link = (curl "$hostname/support/download/officegate/").Links -match 'OfficeGate Configuration Tool.*\(win32_win64\)'
	
	$link.innerText -match '[0-9.]+'
	
	@{
        URL32   = "$hostname$($link.href)"
        Version = $Matches[0]
    }
}

update
