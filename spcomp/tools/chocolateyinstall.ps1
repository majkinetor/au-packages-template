$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6416-windows.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '7aee5fc5425fa2f6ca04c6960f51ed8b1968c8aad926cdb694a2bce412d8a122'
  checksumType           = 'sha256'
  SpecificFolder         = "addons\sourcemod\scripting"
}
Install-ChocolateyZipPackage @packageArgs
