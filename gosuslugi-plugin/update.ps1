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
	$URL32 = 'https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin.msi'
	$URL64 = 'https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-x64.msi'
    Get-ChocolateyWebFile 'foldersizes' $URL32 -FileFullPath "$env:TMP\cadesplugin.exe"
	
	@{
        URL32   = $URL32
		URL64   = $URL64
        Version = (Get-Item "$env:TMP\cadesplugin.exe").VersionInfo.ProductVersion
    }
}

update
