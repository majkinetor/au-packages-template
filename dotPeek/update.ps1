import-module au

function global:au_SearchReplace {
    @{
        'dotPeek.nuspec' = @{
            "(^.+version=`")(\[.*\])(`".+$)"   = "`$1[$($Latest.PlatformVersion)]`$3"
        }
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]filename\s*=\s*)([`"'].*[`"'])"      = "`$1'$($Latest.Filename)'"
        }
        'tools\chocolateyUninstall.ps1' = @{
            "(^[$]filename\s*=\s*)([`"'].*[`"'])"      = "`$1'$($Latest.Filename)'"
        }
     }
}

. ..\resharper-platform\common.ps1

function global:au_GetLatest {
    return GetJetbrainsProductLatest
}

update -ChecksumFor none
