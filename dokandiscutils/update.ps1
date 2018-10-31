import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*FileFullPath\s*=\s*)(`".*`")"   = "`$1`"$($Latest.FileFullPath)`""
        }
    }
}

function global:au_GetLatest {
	$URL32 = 'https://codeplexarchive.blob.core.windows.net/archive/projects/DokanDiscUtils/DokanDiscUtils.zip'
    Get-ChocolateyWebFile 'dokandiscutils' "$env:TMP\DokanDiscUtils.zip" $URL32
    Get-ChocolateyUnzip "$env:TMP\DokanDiscUtils.zip" "$env:TMP" -SpecificFolder "releases\releaseList.json"

	$versions = [ordered]@{}

	(cat "$env:TMP\releases\releaseList.json" | ConvertFrom-Json) | % {
		$_.Name -match '[0-9]+[0-9.]+[0-9]+'
		$version = $Matches[0]

		$versions[$version] = @{
			URL32   = $URL32
			Version = $version
			FileFullPath = "`$env:TMP\releases\$($_.Files[0].Url)"
		}
	}

	@{'Streams' = $versions}
}

update
