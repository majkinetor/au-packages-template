import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {

    # Unfortunately, they're including a Byte Order Mark, so we have to trim that off
    $response = Invoke-RestMethod -Uri "https://download.lenovo.com/ibmdl/pub/pc/pccbbs/agent/SSClientCommon/HelloLevel_9_34_00.xml"
    $xml = [xml] $response.Substring(3)
    $version = $xml.LevelDescriptor.Version
    $buildDate = $xml.LevelDescriptor.BuildDate
    
    $Latest = @{
        URL32 = "https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate$($version).exe";
        ReleaseNotes = "$buildDate release - https://download.lenovo.com/pccbbs/thinkvantage_en/systemupdate$($version).txt"
        Version = $version 
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

update -NoReadme
