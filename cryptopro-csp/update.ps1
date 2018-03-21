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
	$options =
	@{
	  Headers = @{
		'Referer' = 'https://install.kontur.ru/kekep/?XUACompatible=8';
	  }
	}

	$URL32 = 'https://help.kontur.ru/content/components/CSP40R2Setup.exe'
    Get-ChocolateyWebFile 'cryptopro-csp' $URL32 -FileFullPath "$env:TMP\CSP40R2Setup.exe" -Options $options
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\CSP40R2Setup.exe").VersionInfo.ProductVersion.trim()
    }
}

update
