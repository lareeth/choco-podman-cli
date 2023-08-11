$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.6.1/podman-remote-release-windows_amd64.zip'
$checksum       = '8f617ea8a3de73a3d388b485e438c2e8e7fddf8126ad7b1540a5ecba8934d6ae'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
