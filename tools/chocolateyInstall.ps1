$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.0.0/podman-remote-release-windows.zip'
$checksum       = 'ef0bbcd2e7cf060ae5c8859e3fb773881f5ac30ee660d8abf390c5c19dba0985'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
