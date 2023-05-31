$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.0.2/podman-remote-release-windows_amd64.zip'
$checksum       = 'ba07e6073e6b8ac1def2d2464e5ab7645a8b3d6bcdf3a4b68ad29ae2630dda61'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
