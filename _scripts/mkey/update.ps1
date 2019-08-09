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
	$URL32 = 'http://www.seriosoft.org/dl.php?file=MKey.exe'
    Get-ChocolateyWebFile 'mkey' $URL32 -FileFullPath "$env:TMP\MKey.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\MKey.exe").VersionInfo.ProductVersion.trim()
    }
}

update
