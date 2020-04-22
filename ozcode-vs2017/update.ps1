import-module au

. ..\_scripts\common.ps1

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

function global:au_BeforeUpdate() {
    # AU on Appveyor doesn't like Install-VisualStudioVsixExtension in chocolateyinstall.ps1, so calc
    # checksum here instead
    $oldProgressPreference = $global:ProgressPreference
    $global:ProgressPreference = 'SilentlyContinue'
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
    $global:ProgressPreference = $oldProgressPreference
 }

function global:au_GetLatest {
 
    $url = Get-RedirectedUri $releases

    if ($url)
    {
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

update -ChecksumFor none