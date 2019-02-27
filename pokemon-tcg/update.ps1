import-module au

$releases = 'https://www.pokemon.com/us/pokemon-tcg/play-online/download/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases 

	$version = $download_page.ParsedHtml.getElementsByClassName("current-version-info")[1].getElementsByTagName("li")[0].innerText.Trim()
    @{
        URL32   = "https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi"
        Version = $version
    }
}

update