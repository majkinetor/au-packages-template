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
	$URL32 = 'http://www.leoniv.diod.club/articles/ft232rl/downloads/ftester.zip'
    Get-ChocolateyWebFile 'ftester' $URL32 -FileFullPath "$env:TMP\ftester.zip"
	Get-ChocolateyUnzip "$env:TMP\ftester.zip" "$env:TMP"
	
	@{
        URL32   = $URL32
        Version = (ls "$env:TMP\FTester.exe").LastWriteTime | Get-Date -Format 'yyyy.MM.dd'
    }
}

update
