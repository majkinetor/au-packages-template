import-module au

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "([$]Version\s*=\s*)('.*')"      = "`$1'$($Latest.Version)'"
    }
  }
}

function global:au_GetLatest {
  $packages = (&nuget list xenko -s nuget.org) -match '^xenko\s'
  $version = $packages -split ' ' | Select-Object -Last 1 | Select-String '\d{1,4}\.\d{1,4}\.\d{1,4}\.\d{1,4}' -AllMatches | ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } | Select-Object -First 1
  return @{ Version = $version;}
}

Update-Package -ChecksumFor none