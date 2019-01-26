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
        
    $token = $env:github_api_key
    $headers = @{
        'User-Agent' = 'flcdrg'
    }
    if ($token) {
        $headers['Authorization'] = ("token {0}" -f $token)
    }

    $response = Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/Microsoft/azure-devops-cli-extension/releases/latest" -Headers $headers

    $version = $response.tag_name

    $url32 = $response.assets | Where-Object { $_.name.EndsWith(".msi")} | Select-Object -ExpandProperty browser_download_url -First 1
    
    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
