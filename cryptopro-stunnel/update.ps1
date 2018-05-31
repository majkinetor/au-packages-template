import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

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
	$URL32 = 'https://www.cryptopro.ru/sites/default/files/products/stunnel/stunnel_win32.zip'
	$URL64 = 'https://www.cryptopro.ru/sites/default/files/products/stunnel/stunnel_x64.zip'
    Get-ChocolateyWebFile 'cryptopro-stunnel' "$env:TMP\stunnel_win32.zip" $URL32
    Get-ChocolateyUnzip "$env:TMP\stunnel_win32.zip" "$env:TMP" -SpecificFolder "stunnel.exe"
	
	@{
        URL32   = $URL32
		URL64   = $URL64
        Version = (Get-Item "$env:TMP\stunnel.exe").VersionInfo.ProductVersion.trim()
    }
}

update
