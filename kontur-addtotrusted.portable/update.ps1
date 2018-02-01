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
	$URL32 = 'https://help.kontur.ru/content/components/AddToTrusted_User.exe'
    Get-ChocolateyWebFile 'kontur-addtotrusted' $URL32 -FileFullPath "$env:TMP\AddToTrusted_User.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\AddToTrusted_User.exe").VersionInfo.ProductVersion
    }
}

update
