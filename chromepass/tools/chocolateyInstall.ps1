$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.nirsoft.net/toolsdownload/chromepass.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '60cc1a76febb3b0f04d0d0ae6ff5c3bc7886136b6bbc5a93354acc60501e20b6'
  checksumType           = 'sha256'
  Options                = @{Headers=@{'Referer'='https://www.nirsoft.net/utils/chromepass.html'}}
}
Install-ChocolateyZipPackage @packageArgs
