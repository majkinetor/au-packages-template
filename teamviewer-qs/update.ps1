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
    rm tools\TeamViewerQS.exe
}

function global:au_GetLatest {
	$URL32 = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
    Get-ChocolateyWebFile 'teamviewer-qs' $URL32 -FileFullPath "$env:TMP\TeamViewerQS.exe"
	
	$version = (Get-Item "$env:TMP\TeamViewerQS.exe").VersionInfo.FileVersion
	if (!$version) {$version = "$((Get-Item "$env:TMP\TeamViewerQS.exe").VersionInfo.FileVersionRaw)"}
	
	@{
        URL32   = $URL32
        Version = $version.trim()
    }
}

update
