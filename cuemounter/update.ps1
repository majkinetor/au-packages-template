import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*File\s*=\s*)(`".*`")"   = "`$1`"$($Latest.File)`""
        }
    }
}

function global:au_GetLatest {
	$URL32 = 'https://codeplexarchive.blob.core.windows.net/archive/projects/cuemounter/cuemounter.zip'
    Get-ChocolateyWebFile 'cuemounter' "$env:TMP\cuemounter.zip" $URL32
    Get-ChocolateyUnzip "$env:TMP\cuemounter.zip" "$env:TMP" -SpecificFolder "releases\releaseList.json"

	$versions = [ordered]@{}

	(cat "$env:TMP\releases\releaseList.json" | ConvertFrom-Json) | ? {$_.Files | ? {$_.FileName -match '\.msi$'}} | % {
		$_.Name -match '([0-9]+[0-9.]+[0-9]+)'
		$version = $Matches[1]
        $filepath = ($_.Files | ? {$_.FileName -match '\.msi$'}).Url

		$versions[$version] = @{
			URL32   = $URL32
			Version = $version
			File = (Join-Path "$env:TMP\releases" $filepath) -replace [regex]::escape("$env:TMP\"),'$env:TMP\'
		}
	}

	@{'Streams' = $versions}
}

update
