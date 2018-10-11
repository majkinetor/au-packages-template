import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
	$URL32 = 'https://download.microsoft.com/download/D/3/3/D331B37A-CBFA-4FC2-82D5-4953AB06B188/ADMXMigrator.msi'
    Get-ChocolateyWebFile 'admx-migrator' $URL32 -FileFullPath "$env:TMP\ADMXMigrator.msi"
	$packageArgs = @{
	  packageName            = 'admx-migrator'
	  FileType               = 'msi'
	  SilentArgs             = '/qn /norestart'
	  File                   = "$env:TMP\ADMXMigrator.msi"
	}
	Install-ChocolateyInstallPackage @packageArgs
	
	@{
        URL32   = $URL32
        Version = (Get-UninstallRegistryKey -SoftwareName 'FullArmor ADMX Migrator').DisplayVersion
    }
}

update
