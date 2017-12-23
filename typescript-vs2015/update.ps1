import-module au

Add-type -Path ..\packages\HtmlAgilityPack\lib\Net45\HtmlAgilityPack.dll

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

    try {        
        # http://download.microsoft.com/download/6/D/8/6D8381B0-03C1-4BD2-AE65-30FF0A4C62DA/2.3.3-TS-release-dev14update3-20170519.1/TypeScript_Dev14Full.exe

        $htmlWeb = New-Object HtmlAgilityPack.HtmlWeb
        $htmlWeb.AutoDetectEncoding = $true
        $doc = $htmlWeb.Load($releases)

        $links = $doc.DocumentNode.SelectNodes("//a[contains(@href, '.exe')]")
        $link = $links[0]
        $url32 = $link.Attributes["href"].Value.Trim()

        $li = $link.ParentNode

        # first a should be release notes
        $firstA = $li.SelectSingleNode("a")
        $releaseNotes = $firstA.Attributes["href"].Value.Trim()

        # version in filename isn't always complete, so we search for text description before link

        # Use HTTPS
        $builder = [UriBuilder] $url32
        $builder.Scheme = "https"
        $builder.Port = 443
        $url32 = $builder.Uri.ToString()
        
        # TypeScript 2.3.0 RC for Visual Studio 2015
        if ($li.InnerText -match "^TypeScript (?<version>(?<digits>\d+\.\d+\.\d+)( \w*)?) for Visual Studio 2015.*$") {

            $digits = $Matches.digits # 2.3.0
            $installVersion = $Matches.version.Replace($digits, $digits + ".0") #2.3.0.0 RC

            # semver 2.3.0-RC
            $version = $installVersion.Replace(" ", "-")

            Write-Host $version

            $Latest = @{ 
                URL32 = $url32; 
                Version = $version;
                ReleaseNotes = $releaseNotes
                InstallVersion = $installVersion
            }
        } else {
            $Latest = @{}
        }
    } catch {
        Write-Error $_
        $Latest = @{}        
    }
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = Get-Content $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}$($Latest.ReleaseNotes)`$2"

    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update