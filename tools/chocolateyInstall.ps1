$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v3.1.2/podman-remote-release-windows.zip'
$checksum       = 'd43db4928c70805e5550edf317c921ebb4fcbed1994a707f52827b50e7c5e5d5'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
