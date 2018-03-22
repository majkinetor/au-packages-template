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

	$URL32 = 'https://install.kontur.ru/content/components/KD/KonturDiag2_admin.exe'
    Get-ChocolateyWebFile 'kontur-diag' $URL32 -FileFullPath "$env:TMP\KonturDiag2_admin.exe" -Options $options
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\KonturDiag2_admin.exe").VersionInfo.ProductVersion.trim()
    }
}

update
