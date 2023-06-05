$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.4.2/podman-remote-release-windows_amd64.zip'
$checksum       = 'b0f11b787b89b65dc3c514545902513cd4cf2015eefcc40c46f28f4de458c9d1'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
