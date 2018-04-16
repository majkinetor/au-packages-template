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
	$URL32 = 'http://4c11bfaa17c7.dahuaddns.com:7000/webplugin.exe'
    Get-ChocolateyWebFile 'dahua-web-plugin' $URL32 -FileFullPath "$env:TMP\webplugin.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\webplugin.exe").VersionInfo.ProductVersion.trim()
    }
}

update
