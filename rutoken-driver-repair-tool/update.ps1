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
	$URL32 = 'https://download.rutoken.ru/Rutoken/Utilites/rtDrvInstallTool.msi'
    Get-ChocolateyWebFile 'rutoken-driver-repair-tool' "$env:TMP\rtDrvInstallTool.msi" $URL32
    Get-ChocolateyUnzip "$env:TMP\rtDrvInstallTool.msi" "$env:TMP" -SpecificFolder "installer32.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\installer32.exe").VersionInfo.ProductVersion
    }
}

update
