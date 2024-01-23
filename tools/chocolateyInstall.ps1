$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.9.0/podman-remote-release-windows_amd64.zip'
$checksum       = '85f5ee5e3d6aa71cfb715b105dce75d3c14dd7fdb0f58cb375366b86785e603f'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
