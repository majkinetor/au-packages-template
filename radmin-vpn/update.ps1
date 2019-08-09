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
	$hostname = 'https://www.radmin-vpn.com'
	$URL32 = $hostname + ((curl -UseBasicParsing $hostname).Links.href -match '\.exe$' | Get-Unique)
    Get-ChocolateyWebFile 'radmin-vpn' $URL32 -FileFullPath "$env:TMP\Radmin_VPN.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\Radmin_VPN.exe").VersionInfo.ProductVersion.trim()
    }
}

update
