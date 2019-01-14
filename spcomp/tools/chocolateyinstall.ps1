$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6378-windows.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '25d98bc987e9438354ff4a2d4cf44a88c60641e2b68022ac52a371ca986c03ee'
  checksumType           = 'sha256'
  SpecificFolder         = "addons\sourcemod\scripting"
}
Install-ChocolateyZipPackage @packageArgs
