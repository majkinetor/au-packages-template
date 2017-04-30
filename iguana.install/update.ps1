import-module au

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$releases = 'https://www.interfaceware.com/iguana.html'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases #1 
    $url64     = $download_page.links | ? href -match 'x64.exe$' | select -First 1 -expand href

    $url32     = $download_page.links | ? href -match 'x86.exe$' | select -First 1 -expand href

    # http://dl.interfaceware.com/iguana/windows/6_0_6/iguana_6_0_6_windows_x64.exe
    $version = ($url64 -split '/' | select -Skip 5 -First 1) -replace '_', '.'

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update
}