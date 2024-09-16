$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.2/podman-remote-release-windows_amd64.zip'
$checksum       = '05cb0a56146193a8811362f4a901a7bb90992033eb88aff0e43e9a359c6036b4'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
