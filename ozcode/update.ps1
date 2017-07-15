import-module au

$releases = 'https://www.oz-code.com/download/eap'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fileName\s*=\s*)('.*')" = "`$1'$($Latest.fileName)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {

    $request = [System.Net.WebRequest]::Create($releases)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()
 
    if ($response.StatusCode -eq "Found")
    {
        $url = $response.GetResponseHeader("Location")

        # http://downloads.oz-code.com/files/OzCode_3.0.0.3597.exe
        $url -match ".*(?<filename>OzCode_(?<version>\d+\.\d+\.\d+\.\d+)\.exe)"

        $Latest = @{ 
            URL32 = $url
            Version = $Matches.version
            Filename = $Matches.filename
        }
    } else {
        $Latest = @{}
    }

    return $Latest
}

update