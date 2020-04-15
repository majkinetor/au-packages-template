[CmdletBinding()]
param([switch] $Force)

Import-Module AU

$domain   = 'https://github.com'
$releases = "$domain/mscrmtools/xrmtoolbox/releases/latest"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
        "(?i)(^\s*url64bit\s*=\s*)('.*')"     = "`$1'$($Latest.URL64)'"
        "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(?i)(^\s*location on\:?\s*)\<.*\>" = "`${1}<$($Latest.ReleaseURL)>"
      "(?i)(^\s*software.*)\<.*\>"        = "`${1}<$($Latest.URL64)>"
      "(?i)(^\s*checksum\s*type\:).*"     = "`${1} $($Latest.ChecksumType64)"
      "(?i)(^\s*checksum\:).*"            = "`${1} $($Latest.Checksum64)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseURL)`${2}"
    }
  }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $re = 'XrmToolbox\.zip$'
  $url = $download_page.links | ? href -match $re | % href | Select-Object -First 1

  $version = (Split-Path ( Split-Path $url ) -Leaf).Substring(1)

  return @{
    Version     = $version
    URL64       = $domain + $url
    ReleaseURL  = "$domain/mscrmtools/xrmtoolbox/releases/tag/v${version}"
  }
}

update -ChecksumFor none -Force:$Force