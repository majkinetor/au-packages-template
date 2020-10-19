$ErrorActionPreference = 'Stop';

$InstallArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'bazelisk.exe'
    URL64 = 'https://github.com/bazelbuild/bazelisk/releases/download/v1.7.3/bazelisk-windows-amd64.exe'
    Checksum64 = '57c0248010c29241621aa344f8eae6c0112f6ffcc9b7c2bbf15e47a26c8346927d4867f880fae36ad08c8de5adb0bff11663bc482cb56af3cbb72b8ba4560c1e'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @InstallArgs
