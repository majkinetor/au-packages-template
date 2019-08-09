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
	$URL32 = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
    Get-ChocolateyWebFile 'foldersizes' $URL32 -FileFullPath "$env:TMP\fs9-setup.exe"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\fs9-setup.exe").VersionInfo.ProductVersion
    }
}

update
