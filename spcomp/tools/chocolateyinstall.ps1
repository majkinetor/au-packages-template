$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6428-windows.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '41e169a67961b17322f0fdced2bb5bfc246c977d48c296105d20a4c2f283e5d6'
  checksumType           = 'sha256'
  SpecificFolder         = "addons\sourcemod\scripting"
}
Install-ChocolateyZipPackage @packageArgs
