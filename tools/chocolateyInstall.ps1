$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.2.4/podman-remote-release-windows_amd64.zip'
$checksum       = 'c2c83c7cad6bd4ae7349b5512deebbf3a29fb99b72dba1e7fe18281de5c99c16'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
