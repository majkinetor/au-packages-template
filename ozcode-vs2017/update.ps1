import-module au

$releases = 'https://shop.oz-code.com/download/v4'
# http://downloads.oz-code.com/files/OzCode_4.0.0.557.vsix
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

        # http://downloads.oz-code.com/files/OzCode_4.0.0.557.vsix
        $url -match ".*(?<filename>OzCode_(?<version>\d+\.\d+\.\d+\.\d+)\.vsix)"

        $Latest = @{ 
            URL32 = $url
            Version = $Matches.version
            Filename = $Matches.filename
        }
        return $Latest
    } else {
        return 'ignore'
    }
}

update