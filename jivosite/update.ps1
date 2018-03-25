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
	$URL32 = 'https://s3-eu-west-1.amazonaws.com/jivo-userdata/stable/jivosite.msi'
    Get-ChocolateyWebFile 'jivosite' $URL32 -FileFullPath "$env:TMP\jivosite.msi"
	$packageArgs = @{
	  packageName            = 'jivosite'
	  FileType               = 'msi'
	  SilentArgs             = '/qn /norestart'
	  File                   = "$env:TMP\jivosite.msi"
	}
	Install-ChocolateyInstallPackage @packageArgs
	
	@{
        URL32   = $URL32
        Version = (Get-UninstallRegistryKey -SoftwareName 'JivoSite').DisplayVersion
    }
}

update
