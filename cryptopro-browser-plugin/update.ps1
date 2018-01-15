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
	$URL32 = 'https://www.cryptopro.ru/products/cades/plugin/get_2_0'
    Get-ChocolateyWebFile 'foldersizes' $URL32 -FileFullPath "$env:TMP\cadesplugin.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\cadesplugin.exe").VersionInfo.ProductVersion
    }
}

update
