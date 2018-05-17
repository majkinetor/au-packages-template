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
	$URL32 = 'http://randersoft.com/download/Rsetup5.rar'
    Get-ChocolateyWebFile 'rander' $URL32 -FileFullPath "$env:TMP\Rsetup5.rar"
    Get-ChocolateyUnzip "$env:TMP\Rsetup5.rar" "$env:TMP"
	$packageArgs = @{
	  packageName            = 'rander'
	  FileType               = 'exe'
	  SilentArgs             = '/S'
	  File                   = "$env:TMP\Rsetup5.exe"
	}
	Install-ChocolateyInstallPackage @packageArgs
	
	@{
        URL32   = $URL32
        Version = (Get-UninstallRegistryKey -SoftwareName 'Rander').DisplayVersion
    }
}

update
