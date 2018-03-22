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
	$URL32 = 'https://trusted.ru/filedownload.php?file=492'
    Get-ChocolateyWebFile 'cryptoarm' $URL32 -FileFullPath "$env:TMP\td_eng.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\td_eng.exe").VersionInfo.ProductVersion.trim()
    }
}

update
