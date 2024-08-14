$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.1/podman-remote-release-windows_amd64.zip'
$checksum       = 'ca5d2221d88e0d7b6ccd39a3f50df7351919f648bab4f428fec74bba98b0ef72'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
