$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6375-windows.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9d4df3ddc051061b706d40db8e452845eca3aa799cb50a6d25dd6c964a4ddf04'
  checksumType           = 'sha256'
  SpecificFolder         = "addons\sourcemod\scripting"
}
Install-ChocolateyZipPackage @packageArgs
