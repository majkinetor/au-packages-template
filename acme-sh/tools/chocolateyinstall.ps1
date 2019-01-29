$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.8.0.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ec4c49b5ad164a36477bbb040716ff645870b840d219f32766f5b38dc12af360'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
