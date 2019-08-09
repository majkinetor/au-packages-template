import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*File\s*=\s*)(`".*`")"     = "`$1`"$($Latest.File)`""
        }
    }
}

function global:au_GetLatest {
	$versions = [ordered]@{}

	$baseURL = 'https://www.gnivc.ru'

	(curl -UseBasicParsing "$baseURL/software/fnspo/pdf417/").Links.href | ? {($_ -split '/')[-1] -match '^pdf417'} | Get-Unique | % {
		$URL32 = "$baseURL$_"
		$archivePath = "$env:TMP\$($([uri]$URL32).segments[-1])"

		Get-ChocolateyWebFile 'pdf417' $archivePath $URL32

		$versionFolderPath = "$env:TMP\$($(ls $archivePath).BaseName)"

		Get-ChocolateyUnzip $archivePath $versionFolderPath

		$(ls "$versionFolderPath\*.msi").BaseName -match '\(([0-9]+[0-9.]+[0-9]+)\)'

		$versions[$Matches[1]] = @{
			URL32   = $URL32
			Version = $Matches[1]
			File    = "`$env:TMP\$($(ls "$versionFolderPath\*.msi").Name)"
		}
	}

	@{'Streams' = $versions}
}

update
