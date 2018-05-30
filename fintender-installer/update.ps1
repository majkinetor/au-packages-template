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
    rm tools\Fintender.Installer.Setup.exe
}

function global:au_GetLatest {
	$URL32 = 'https://private.fintender.ru/files/Fintender.Installer.Setup.exe'
    Get-ChocolateyWebFile 'fintender-installer' $URL32 -FileFullPath "$env:TMP\Fintender.Installer.Setup.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\Fintender.Installer.Setup.exe").VersionInfo.FileVersion.trim()
    }
}

update
