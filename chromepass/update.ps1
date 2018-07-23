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
	$URL32 = 'https://www.nirsoft.net/toolsdownload/chromepass.zip'
	$downloadOptions = @{Headers=@{'Referer'='https://www.nirsoft.net/utils/chromepass.html'}}
    Get-ChocolateyWebFile 'chromepass' $URL32 -FileFullPath "$env:TMP\chromepass.zip" -Options $downloadOptions
	Get-ChocolateyUnzip -FileFullPath "$env:TMP\chromepass.zip" -Destination "$env:TMP"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\ChromePass.exe").VersionInfo.ProductVersion.trim()
		Options = $downloadOptions
    }
}

update
