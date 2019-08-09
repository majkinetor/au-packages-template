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
	$URL32 = 'http://www.gsm-sprut.com/files/file/SprutUniversal/sms/smsserver.zip'
    Get-ChocolateyWebFile 'sprut-sms-server' "$env:TMP\smsserver.zip" $URL32
    Get-ChocolateyUnzip "$env:TMP\smsserver.zip" "$env:TMP" -SpecificFolder "sms_server_setup.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\sms_server_setup.exe").VersionInfo.ProductVersion.trim()
    }
}

update
