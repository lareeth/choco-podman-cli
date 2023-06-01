$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.1.1/podman-remote-release-windows_amd64.zip'
$checksum       = '1dbeea2a04308bcc038081ff16c50d0995ecafdded944ed366ee56e884edf91e'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
