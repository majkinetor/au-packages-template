$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType = 'exe'
    SilentArgs = '/S'
    URL64 = 'https://github.com//mypaint/mypaint/releases/download/v2.0.1/mypaint-w64-2.0.1-installer.exe'
    URL = 'https://github.com//mypaint/mypaint/releases/download/v2.0.1/mypaint-w32-2.0.1-installer.exe'
    Checksum64 = '1426a296184466b9d1ceafcaa16ac37c3e3baae3f945c80ad0032361e4e50667867835324b370480fc721284ef8e0bf65f4630730cfa76de16275bf3954073c8'
    Checksum = 'b0229d0f4f91d69f106188ee89f2007d888288ec8b303d640655af1e67427ea99b06a27d04eebad1e126dc810879ab9e3b20e7622fa7015cc99314559f333b8a'
    ChecksumType64 = 'sha512'
    ChecksumType = 'sha512'
}

Install-ChocolateyPackage @InstallArgs

