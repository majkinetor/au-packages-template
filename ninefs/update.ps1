import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
	$versions = [ordered]@{}

	(curl "https://storage.googleapis.com/google-code-archive/v2/code.google.com/ninefs/downloads-page-1.json" | ConvertFrom-Json).downloads | ? {
		($_.labels -contains 'Type-Executable') -and ($_.labels -contains 'OpSys-Windows') -and ($_.filename -match '^ninefs')
	} | % {
		$_.summary -match '^([0-9]{4})([0-9]{2})([0-9]{2}) ninefs binary$' > $null

		$version = $Matches[1..3] -join '.'

		$versions[$version] = @{
			URL32 = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ninefs/$($_.filename)"
			Version = $version
		}
	}

	@{Streams = $versions}
}

update
