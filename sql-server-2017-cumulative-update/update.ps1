import-module au

function global:au_SearchReplace {
    @{
        #   softwareName  = 'Hotfix 3026 for Microsoft SQL Server*(KB4229789)*'
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(^[$]softwareName\s*=\s*)('.*')" = "`$1'Hotfix $($Latest.Build) for SQL Server 2017*(KB$($Latest.KB))*'"
        }
     }
}

function global:au_GetLatest {
    $response = Invoke-WebRequest -Uri "https://www.microsoft.com/en-us/download/confirmation.aspx?id=56128" -ErrorAction Ignore

    $url = $response.Content | Select-String -AllMatches -Pattern "(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?" | % { $_.Matches.Value } | Select-string "\.exe$" | Select-Object -First 1
    
    # <meta name="Description" content="Cumulative Update Package 7 for SQL Server 2017 - KB4229789" />
    if ($response.Content -match "<meta name=`"Description`" content=`"Cumulative Update Package (\d+) for SQL Server 2017 - KB(\d+)`" \/\>") {
        $cu = $Matches[1]
        $kb = $Matches[2]
    } else {
        return @{}
    }

    $response = Invoke-WebRequest -Uri "https://www.microsoft.com/en-us/download/details.aspx?id=56128"

    if ($response.Content -match "\d+\.\d+\.\d+\.\d+") {
        $version = $Matches[0]
    } else {
        return @{}
    }
    
    $v = [Version] $version
    $Latest = @{ 
        URL64 = $url
        Version = $version
        KB = $kb
        CU = $cu
        Build = $v.Build
    }
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = Get-Content $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}http://support.microsoft.com/help/$($Latest.KB)`$2"

    $nu = $nu -replace "(?smi)(\<title\>).*?(\</title\>)", "`${1}Microsoft SQL Server 2017 Cumulative Update $($Latest.CU)`$2"
    
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update
