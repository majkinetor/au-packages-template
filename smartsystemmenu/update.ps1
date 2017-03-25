$releases = 'http://smartsysmenu.codeplex.com/releases/view/112519'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $regex32 = [regex]'^http://smartsysmenu.codeplex.com/downloads/get/'
    $tag   = ($download_page.links | ? href -match $regex32 | select -First 1)
    $verreg  = [regex]'^SmartSystemMenu v(.*?)$'
    $version =  $verreg.Match( $tag.innerText ).Groups[1]
    
    return @{ 
        Version = $version;
        URL32 = $tag.href;
        ChecksumType32 = 'sha256';
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"          
            "(?i)(^\s*checksum\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum32)'"     
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"           
            "(?i)(^\s*checksum64\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum64)'"     
        }
    }
    throw "Need to update by hand";man
    
}


update -NoCheckUrl