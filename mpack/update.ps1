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
	$versions = [ordered]@{}

	$rss = [xml](curl 'https://sourceforge.net/projects/mpack-win/rss')
	$file = $rss.rss.channel.item | ? {$_.title.'#cdata-section' -match '[0-9]+\.zip$'} | % {
		$_.title.'#cdata-section' -match '([0-9])([0-9]+)'
		$version = $Matches[1..2] -join '.'

		$versions[$version] = @{
			URL32   = $_.link
			Version = $version
		}
	}

	@{'Streams' = $versions}
}

update
