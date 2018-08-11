$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\acme.sh"
  url                    = 'https://raw.githubusercontent.com/Neilpang/acme.sh/2.7.9/acme.sh'
  checksum               = '4321b2e53be435f6d17c479a2212257e9c895367ce3a653aa33f25d80760720b'
  checksumType           = 'sha256'
}

(New-Object System.Net.WebClient).DownloadFile($packageArgs.url, $packageArgs.FileFullPath)
Get-ChecksumValid -File $packageArgs.FileFullPath -CheckSum $packageArgs.checksum -ChecksumType $packageArgs.sha256
