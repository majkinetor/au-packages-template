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
    $release = curl https://api.github.com/repos/LongSoft/UEFITool/releases/latest | ConvertFrom-Json
	
	@{
        URL32   = ($release.assets | where {$_.name.StartsWith("UEFITool_")}).browser_download_url
        Version = $release.tag_name
    }
}

update
