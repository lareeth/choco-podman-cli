$packageName    = 'podman-cli'
$url            = 'https://github.com/containers/podman/releases/download/v4.7.1/podman-remote-release-windows_amd64.zip'
$checksum       = '24238035d2068b6fffe10dc4411dd05bde213d26fd09851ddba46b7081a2c4e9'
$checksumType   = 'sha256'
$validExitCodes = @(0)
 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
Install-ChocolateyZipPackage `
  -PackageName $packageName `
  -Url64bit "$url" `
  -UnzipLocation "$toolsDir" `
  -Checksum64 $checksum `
  -ChecksumType64 $checksumType
