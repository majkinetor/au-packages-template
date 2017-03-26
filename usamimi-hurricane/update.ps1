$releases = 'http://www.vector.co.jp/download/file/win95/prog/fh682302.html'

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $regex   = 'http://ftp.vector.co.jp/.*?\.zip$'
    $url     = ($download_page.links | ? href -match $regex | select -First 1 -expand href)
    
    $download_page.RawContentStream.Position = 0
    $sjis = (New-Object IO.StreamReader($download_page.RawContentStream, [System.Text.Encoding]::GetEncoding("Shift_JIS"))).ReadToEnd()
    $verregex = [regex]'title="詳細ページへ">うさみみハリケーン (.*?)</a></h2>'
    $version = ($verregex.Match( $sjis ).Groups[1]).ToString()
    echo $url
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