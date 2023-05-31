$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.4.1/podman-remote-release-windows.zip'
$checksum       = 'fdd791c82f868699c481ee9807b6b7c47f924464deaa1d2b050c03ef1c7fbb77'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
