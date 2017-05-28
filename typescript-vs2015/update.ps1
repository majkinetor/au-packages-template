import-module au

$releases = 'https://www.microsoft.com/en-us/download/details.aspx?id=48593'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]installVersion\s*=\s*)('.*')" = "`$1'$($Latest.InstallVersion)'"
        }

        'tools\chocolateyUninstall.ps1' = @{
            "(^[$]installVersion\s*=\s*)('.*')" = "`$1'$($Latest.InstallVersion)'"
        }
     }
}

function global:au_GetLatest {

# http://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.3.3-TS-release-dev14update3-20170519.1/TypeScript_Dev14Full.exe
    $download_page = Invoke-WebRequest -Uri $releases #1 

    $links = $download_page.links
    $url32     = $links | ? href -match '.exe$' | select -First 1 -expand href

    $releaseNotes = $links | Where-Object { $_.href.StartsWith("https://github.com/Microsoft/TypeScript/releases/tag/") } | Select-Object -First 1 -ExpandProperty Href

    # version in filename isn't always complete, so we search for text description before link
    $all = $download_page.ParsedHtml.body.all
    $a = $all | Where { $_.tagName -eq 'a' -and $_.href -eq $url32 }
    $li = $a.parentElement

    # Use HTTPS
    $builder = [UriBuilder] $url32
    $builder.Scheme = "https"
    $builder.Port = 443
    $url32 = $builder.Uri.ToString()
    
    # TypeScript 2.3.0 RC for Visual Studio 2015
    if ($li.innerText -match "^TypeScript (?<version>(?<digits>\d+\.\d+\.\d+)( \w*)?) for Visual Studio 2015.*$") {

        $digits = $Matches.digits # 2.3.0
        $installVersion = $Matches.version.Replace($digits, $digits + ".0") #2.3.0.0 RC

        # semver 2.3.0-RC
        $version = $installVersion.Replace(" ", "-")

        $Latest = @{ 
            URL32 = $url32; 
            Version = $version;
            ReleaseNotes = $releaseNotes
            InstallVersion = $installVersion
        }
    } else {
        $Latest = @{}
    }
    
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = gc $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}$($Latest.ReleaseNotes)`$2"

    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update