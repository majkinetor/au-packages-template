import-module au

$releases = 'https://github.com/adafruit/Adafruit-Pi-Finder/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    #PiFinder-3.0.0-win32-x64.zip
    $re  = "PiFinder-.+-win32-(ia32|x64).zip"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = $url[0] -split '-' | select -Last 1 -Skip 2
    $url32 = 'https://github.com' + $url[0]
    $url64 = 'https://github.com' + $url[1]

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
