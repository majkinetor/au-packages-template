import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]filename\s*=\s*)('.*')"      = "`$1'$($Latest.Filename)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

. .\common.ps1

function global:au_GetLatest {
    return GetJetbrainsReSharperPlatformLatest
}

update -ChecksumFor none