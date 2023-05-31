$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.1.1/podman-remote-release-windows.zip'
$checksum       = '21d8cbc6d350510905ea775368989470096c216f6368cdc5c12cd3d2569f37a3'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
