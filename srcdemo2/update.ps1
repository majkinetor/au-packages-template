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

	((curl "https://storage.googleapis.com/google-code-archive/v2/code.google.com/srcdemo2/downloads-page-1.json" | ConvertFrom-Json).downloads | ? {
		($_.labels -contains 'Type-Installer') -and ($_.labels -contains 'OpSys-Windows')
	}).filename | % {
		$_ -match 'SrcDemo2-setup-(.+).exe' > $null

		$version = $Matches[1] -replace '-','.'

		$versions[$version] = @{
			URL32 = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/srcdemo2/$_"
			Version = $version
		}
	}

	@{Streams = $versions}
}

update
