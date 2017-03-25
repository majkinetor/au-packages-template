$releases = 'https://tkool.jp/support/download/rpgvx/rtp'

function global:au_GetLatest {
     $download_page = Invoke-WebRequest -Uri $releases
     $regex   = 'zip$'
     $verregex= [regex]'rtp(.*?)\.zip$'
     $url     = "https://tkool.jp/" + ($download_page.links | ? href -match $regex | select -First 1 -expand href)
     $version = ($verregex.Match( $url ).Groups[1]).ToString() + ".0"
     return @{ 
        Version = $version;
        URL32 = $url;
        ChecksumType32 = 'sha256'
     }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           #1
            "(?i)(^\s*checksum\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum32)'"      #2
        }
    }
}


update -ChecksumFor 32