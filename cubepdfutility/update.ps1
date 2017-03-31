
function global:au_GetLatest {
    $version = (Invoke-WebRequest https://api.github.com/repos/cube-soft/CubePdfUtility2/tags -UseBasicParsing | ConvertFrom-Json)[0].name
    return @{ 
        Version = $version;
        URL32 = "http://www.cube-soft.jp/cubepdfutility/dl.php?mode=x86";
        URL64 = "http://www.cube-soft.jp/cubepdfutility/dl.php?mode=x64"
        ChecksumType32 = 'sha256'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           #1
            "(?i)(^\s*checksum\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum32)'"      #2
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"           #1
            "(?i)(^\s*checksum64\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum64)'"      #2
        }
    }
}


Update-Package