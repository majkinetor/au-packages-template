import-module au

function global:au_SearchReplace {
    @{
        'ReSharper.nuspec' = @{
            "(^.+version=`")(\[.*\])(`".+$)"   = "`$1[$($Latest.PlatformVersion)]`$3"
        }
     }
}

. ..\resharper-platform\common.ps1

function global:au_GetLatest {
    return GetJetbrainsProductLatest
}

update -ChecksumFor none
