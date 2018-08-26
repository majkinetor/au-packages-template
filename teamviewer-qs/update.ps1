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
    $versions = [ordered]@{}

    [array]'https://download.teamviewer.com/download/TeamViewerQS.exe'+(curl 'https://www.teamviewer.com/ru/download/old-versions.aspx').Links.href -match '/TeamViewerQS\.exe$' | %{
        $filename = "$env:TMP\$([guid]::NewGuid()).exe"
        Get-ChocolateyWebFile 'teamviewer-qs' "$_" -FileFullPath $filename

        $version = ''
        try {
            $version = [version](Get-Item $filename).VersionInfo.FileVersion.trim()
        }catch{
        }
	    if (!$version) {$version = (Get-Item $filename).VersionInfo.ProductVersionRaw}
        $versions[$version.major, $version.minor -join '.'] = @{URL32 = "$_"; Version = "$version"}
    }

	@{Streams = $versions}
}

update
