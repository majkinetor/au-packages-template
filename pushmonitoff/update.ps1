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
	$URL32 = 'https://www.dcmembers.com/skrommel/download/pushmonitoff/?wpdmdl=361'
    Get-ChocolateyWebFile 'pushmonitoff' $URL32 -FileFullPath "$env:TMP\PushMonitOff.zip"
	Get-ChocolateyUnzip "$env:TMP\PushMonitOff.zip" "$env:TMP"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\PushMonitOff\PushMonitOff.exe").VersionInfo.ProductVersion.trim()
    }
}

update
