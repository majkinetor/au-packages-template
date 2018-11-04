import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
	$URL32 = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin.msi'
	$URL64 = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x64.msi'
    Get-ChocolateyWebFile 'gosuslugi-plugin' $URL32 -FileFullPath "$env:TMP\IFCPlugin.msi"
	$packageArgs = @{
	  packageName            = 'gosuslugi-plugin'
	  FileType               = 'msi'
	  SilentArgs             = '/qn /norestart'
	  File                   = "$env:TMP\IFCPlugin.msi"
	}
	Install-ChocolateyInstallPackage @packageArgs
	
	@{
        URL32   = $URL32
		URL64   = $URL64
        Version = "$(ls "$env:APPDATA\Rostelecom\IFCPlugin")"
    }
}

update
