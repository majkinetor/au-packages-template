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

function global:au_BeforeUpdate() {
    rm tools\cpfixit.exe
}

function global:au_GetLatest {
	$URL32 = 'https://www.cryptopro.ru/sites/default/files/public/cpfixit.exe'
    Get-ChocolateyWebFile 'cpfixit' $URL32 -FileFullPath "$env:TMP\cpfixit.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\cpfixit.exe").VersionInfo.FileVersion.trim()
    }
}

update
