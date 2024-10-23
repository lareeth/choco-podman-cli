$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v5.3.0-rc1/podman-remote-release-windows_amd64.zip'
$checksum       = 'a11fae66b8e48ed289f911794618dd37553ebce079e7c5047857f681e6482609'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
