$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6431-windows.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9e4ffb80648177ac8719f495907c2fa8b03c3b1bdaf84530bd24f53152f8c2b4'
  checksumType           = 'sha256'
  SpecificFolder         = "addons\sourcemod\scripting"
}
Install-ChocolateyZipPackage @packageArgs
