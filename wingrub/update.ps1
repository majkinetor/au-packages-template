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

	([xml](curl 'https://sourceforge.net/projects/grub4dos/rss?path=/WINGRUB')).rss.channel.item | ? {$_.title.'#cdata-section' -match '\.EXE$'} | % {
		$_.title.'#cdata-section' -match '([0-9]{2})([0-9]{2})' > $null

		$version = $Matches[1..2]

		$version[1] = [int]$version[1]

		$version = (@(0) + $version) -join '.'

		$versions[$version] = @{
			URL32   = $_.link
			Version = $version
		}
	}

	@{'Streams' = $versions}
}

update
