$packageName    = 'podman-cli'
$url            = 'https://github.com/lareeth/podman-cli-builder/releases/download/v2.1.0/podman-remote-release-windows.zip'
$checksum       = '77A701501A609E22721B37131FECEF5DD76FCC34EA44C0D8A6F2EB6D6DBAE176'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
