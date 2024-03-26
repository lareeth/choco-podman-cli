$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.0.0/podman-remote-release-windows_amd64.zip'
$checksum       = 'ed2d0c91f35e207dcef5eddbb00b2641d0c81ed6045711160bcce7a9fbd30d7e'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
