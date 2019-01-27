import-module au

$releases = 'https://s3.amazonaws.com/videostream-cdn/videostream-native-updates/windows/x64/RELEASES'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
			"(?i)(^\s*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases 

	($download_page.RawContent -split '\n' | select -last 1) -match 'Videostream-(.*)-'
	
	$version = $matches[1]
	
    @{
        URL32   = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
		URL64   = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'
        Version = $version
    }
}

update