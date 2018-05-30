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
	$options =
	@{
	  Headers = @{
		'User-Agent' = 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36';
	  }
	}

	$URL32 = 'https://www.cryptopro.ru/products/cades/plugin/get_2_0'
    Get-ChocolateyWebFile 'foldersizes' $URL32 -FileFullPath "$env:TMP\cadesplugin.exe" -Options $options
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\cadesplugin.exe").VersionInfo.ProductVersion
    }
}

update -NoCheckUrl
