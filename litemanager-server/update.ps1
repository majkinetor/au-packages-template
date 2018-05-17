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
	$URL32 = 'http://litemanager.com/soft/litemanager_4.8.zip'
    Get-ChocolateyWebFile 'litemanager-server' $URL32 -FileFullPath "$env:TMP\litemanager_4.8.zip"
    Get-ChocolateyUnzip "$env:TMP\litemanager_4.8.zip" "$env:TMP"
	$packageArgs = @{
	  packageName            = 'litemanager-server'
	  FileType               = 'msi'
	  SilentArgs             = '/qn /norestart'
	  File                   = "$env:TMP\LiteManager Pro - Server.msi"
	}
	Install-ChocolateyInstallPackage @packageArgs
	
	$version = (Get-UninstallRegistryKey -SoftwareName 'LiteManager Pro - Server').DisplayVersion
	$build = (ls "$env:TMP\ver_*.txt").Name -replace '^ver_(.*)\.txt$','$1'
	
	if ($version) {
		@{
			URL32   = $URL32
			Version = "$version.$build"
		}
	}
}

update
