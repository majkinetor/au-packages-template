$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/mypaint/mypaint/releases/download/v1.2.1/mypaint-w32-1.2.1-20170129a-installer.exe'
$url64 = 'https://github.com/mypaint/mypaint/releases/download/v1.2.1/mypaint-w64-1.2.1-20170129a-installer.exe'
$checksum32 = '63920ba369470dff0ead5a072954d5292b157b0b56c43893d57758e8aa354e777b060afe2e04681c92344c64961f8b63b21204aee5517bef674ea03a534efe6b'
$checksum64 = '9af52b654cf1932a7ad0013ada9d307a5013fdeb87c304ae0b25a701934f117c9f16a4eb505875e223de2e3dc10e3c41381b4d7c603e40e64431921eea28ef88'
$checksumType32 = 'sha512'
$checksumType64 = 'sha512'
Install-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/S' -Url $url32 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -CheckSumType64 $checksumType64 -Url64 $url64

