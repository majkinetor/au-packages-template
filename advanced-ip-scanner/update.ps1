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
	$hostname = 'https://www.advanced-ip-scanner.com'
	$URL32 = $hostname + ((curl -UseBasicParsing $hostname).Links.href -match '\.exe$' | Get-Unique)
    Get-ChocolateyWebFile 'advanced-ip-scanner' $URL32 -FileFullPath "$env:TMP\Advanced_IP_Scanner.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\Advanced_IP_Scanner.exe").VersionInfo.ProductVersion.trim()
    }
}

update
