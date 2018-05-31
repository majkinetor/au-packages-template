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
	$URL32 = 'http://ftp.lissi.ru/LISSI-CSP/win10/LISSI-CSP-Setup-win32.exe'
	$URL64 = 'http://ftp.lissi.ru/LISSI-CSP/win10/LISSI-CSP-Setup-x64.exe'
    Get-ChocolateyWebFile 'lissi-csp' $URL32 -FileFullPath "$env:TMP\LISSI-CSP-Setup-win32.exe"
	
	@{
        URL32   = $URL32
		URL64   = $URL64
        Version = (Get-Item "$env:TMP\LISSI-CSP-Setup-win32.exe").VersionInfo.ProductVersion.trim()
    }
}

update
