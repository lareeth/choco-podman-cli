$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.0.3/podman-remote-release-windows_amd64.zip'
$checksum       = '245b742e01d63a83390414b1cc2fc8835ca9edd67b8df88c66465c8bdc553372'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
