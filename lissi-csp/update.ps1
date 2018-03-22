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
	$URL32 = 'http://ftp.lissi.ru/LISSI-CSP/win10/LISSI-CSP-Setup-win32.exe'
    Get-ChocolateyWebFile 'lissi-csp' $URL32 -FileFullPath "$env:TMP\LISSI-CSP-Setup-win32.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\LISSI-CSP-Setup-win32.exe").VersionInfo.ProductVersion.trim()
    }
}

update
