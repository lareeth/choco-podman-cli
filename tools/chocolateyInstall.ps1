$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.1.2/podman-remote-release-windows_amd64.zip'
$checksum       = '8b0606fe8f57e06c3cb6ce30c989e9a07494d7312de54a376009ccc3b637b153'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
