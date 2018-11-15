import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://www.interfaceware.com/downloads.html'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    # Find out public version
    $download_page = Invoke-WebRequest -Uri $releases #1 
    $url     = $download_page.links | ? href -match 'x64.exe$' | select -First 1 -expand href


    # http://dl.interfaceware.com/iguana/windows/6_0_6/iguana_6_0_6_windows_x64.exe
    $originalVersion = $url -split '/' | select -Skip 5 -First 1
    $version = $originalVersion -replace '_', '.'

    $baseUrl = $url.Substring(0, $url.LastIndexOf('/') + 1)

    $download_page = Invoke-WebRequest -Uri $baseUrl

    $url32 = $baseUrl + ($download_page.links | ? href -match "iguana_noinstaller_$($originalVersion)_windows_x86.zip$" | select -First 1 -expand href)
    $url64 = $baseUrl + ($download_page.links | ? href -match "iguana_noinstaller_$($originalVersion)_windows_x64.zip$" | select -First 1 -expand href)

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update