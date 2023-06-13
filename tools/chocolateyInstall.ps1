$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.5.1/podman-remote-release-windows_amd64.zip'
$checksum       = '1bcacd15b23642a838f05e8477d761aeb78fa04838c4951c4731b85be3f580c4'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
