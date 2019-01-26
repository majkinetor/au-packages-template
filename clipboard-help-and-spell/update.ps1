import-module au

$releases = 'https://www.donationcoder.com/software/mouser/popular-apps/clipboard-help-and-spell'

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

    $ob = $download_page.links | Where-Object href -like '*download*.exe'
	$version = $ob.innerText.Replace(' Download v','')
    @{
        URL32   = "https://www.donationcoder.com/Software/Mouser/clipboardhelpandspell/downloads/ClipboardHelpAndSpellSetup.exe"
        Version = $version
    }
}

update