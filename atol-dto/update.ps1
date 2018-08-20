import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*SpecificFolder\s*=\s*)('.*')"   = "`$1'$($Latest.SpecificFolder)'"
			"(?i)(^\s*FileFullPath\s*=\s*)(`".*`")"   = "`$1`"$($Latest.FileFullPath)`""
			"(?i)(^\s*FileFullPath64\s*=\s*)(`".*`")" = "`$1`"$($Latest.FileFullPath64)`""
			"(?i)(^\s*File\s*=\s*)(`".*`")"           = "`$1`"$($Latest.File)`""
			"(?i)(^\s*File64\s*=\s*)(`".*`")"         = "`$1`"$($Latest.File64)`""
        }
    }
}

function global:au_GetLatest {
	$rss = [xml](curl 'http://fs.atol.ru/_layouts/15/atol.templates/Handlers/RSSHandler.ashx?rss=e5c8ea9f-5b28-47e6-88a5-aea118c20546').Content
	
	$link = [xml]($rss.rss.channel.item.description -split '<br/>')[3]
	
	Get-ChocolateyWebFile 'atol-dto' $link.a.href -FileFullPath "$env:TMP\atol-dto.zip"
	Get-ChocolateyUnzip "$env:TMP\atol-dto.zip" "$env:TMP\atol-dto"
	
	$link.a.'#text' -match '[0-9.]+'
	
	@{
        URL32   = $link.a.href
        Version = $Matches[0]
		SpecificFolder = $(ls "$env:TMP\atol-dto\*\installer\exe") -replace [regex]::escape("$env:TMP\atol-dto\"),''
		FileFullPath = $(ls "$env:TMP\atol-dto\*\installer\exe\*-windows32-*.exe") -replace [regex]::escape("$env:TMP\atol-dto"),'$env:TMP'
		FileFullPath64 = $(ls "$env:TMP\atol-dto\*\installer\exe\*-windows64-*.exe") -replace [regex]::escape("$env:TMP\atol-dto"),'$env:TMP'
		File = $(ls "$env:TMP\atol-dto\*\installer\exe\*-windows32-*.exe") -replace [regex]::escape("$env:TMP\atol-dto"),'$env:TMP'
		File64 = $(ls "$env:TMP\atol-dto\*\installer\exe\*-windows64-*.exe") -replace [regex]::escape("$env:TMP\atol-dto"),'$env:TMP'
    }
}

update
