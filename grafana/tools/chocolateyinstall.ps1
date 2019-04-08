$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '87d24633840af5804d394d208801515bd759429f5217e9a6b92a61798d7e34af'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
