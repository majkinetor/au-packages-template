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
	$URL32 = 'http://soft.lissi.ru/docs/Fox_XCA/win/Fox-XCA-Setup.exe'
    Get-ChocolateyWebFile 'fox-xca' $URL32 -FileFullPath "$env:TMP\Fox-XCA-Setup.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\Fox-XCA-Setup.exe").VersionInfo.ProductVersion.trim()
    }
}

update
