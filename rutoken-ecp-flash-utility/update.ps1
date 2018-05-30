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

function global:au_BeforeUpdate() {
    rm tools\RutokenFlashTool.exe
}

function global:au_GetLatest {
	$URL32 = 'https://download.rutoken.ru/Rutoken/Utilites/RutokenFlashTool.exe'
    Get-ChocolateyWebFile 'rutoken-ecp-flash-utility' $URL32 -FileFullPath "$env:TMP\RutokenFlashTool.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\RutokenFlashTool.exe").VersionInfo.FileVersion
    }
}

update
