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
	$URL32 = 'https://s3.amazonaws.com/KeyMetricSoft/FolderSizes/fs8-setup.exe'
    Get-ChocolateyWebFile 'foldersizes' $URL32 -FileFullPath "$env:TMP\fs8-setup.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\fs8-setup.exe").VersionInfo.ProductVersion
    }
}

update
